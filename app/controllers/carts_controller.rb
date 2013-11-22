require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

class CartsController < ApplicationController

	before_filter :authenticate_user!


	# GET /carts
	# GET /carts.json
	def index
		@carts = Cart.all

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @carts }
		end
	end

	# GET /carts/1
	# GET /carts/1.json
	def show
		@cart = view_context.current_cart

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @cart }
		end
	end

	# GET /carts/new
	# GET /carts/new.json
	def new
		@cart = Cart.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @cart }
		end
	end

	# GET /carts/1/edit
	def edit
		@cart = Cart.find(params[:id])
	end

	# POST /carts
	# POST /carts.json
	def create
		@cart = Cart.new(params[:cart])

		respond_to do |format|
			if @cart.save
				format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
				format.json { render json: @cart, status: :created, location: @cart }
			else
				format.html { render action: "new" }
				format.json { render json: @cart.errors, status: :unprocessable_entity }
			end
		end
	end

	# PUT /carts/1
	# PUT /carts/1.json
	def update
		@cart = Cart.find(params[:id])

		respond_to do |format|
			if @cart.update_attributes(params[:cart])
				format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @cart.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /carts/1
	# DELETE /carts/1.json
	def destroy
		@cart = Cart.find(params[:id])
		@cart.destroy

		respond_to do |format|
			format.html { redirect_to carts_url }
			format.json { head :no_content }
		end
	end


	def add_to_cart
		view_context.current_cart.add_item(params[:product_id], session[:current_person]) #correct???
																						  # redirect to shopping cart or whereever

		@person = Person.find(session[:current_person])
																						  #redirect_to cart_path(view_context.current_cart)
		redirect_to person_path(@person)
	end

	def remove_item
		logger.info "REMOVING ITEM WITH ID:" + params[:id].inspect
		view_context.current_cart.cart_items.each do |ci|
			logger.info "#{ci.id} #{ci.product_id} #{ci.price} #{ci.qty}"
		end
		view_context.current_cart.remove_item(params[:id], session[:current_person]) #correct???
		@person = Person.find(session[:current_person])
																					 #redirect_to cart_path(view_context.current_cart)
		redirect_to person_path(@person)
	end

	#
	# Present the checkout view
	#
	def present_checkout_view

	end

	#
	# Perform the checkout
	#
	def checkout

	end

	def credit_card_payment
		cc_number     = params[:cc_number]
		cc_exp_year   = params[:cc_exp_year]
		cc_exp_month  = params[:cc_exp_month]
		cc_cvv2       = params[:cc_cvv2]
		cc_first_name = params[:cc_first_name]
		cc_last_name  = params[:cc_last_name]


		# TEST TEST TEST TEST
		cc_data       = {
			:type         => "visa",
			:number       => cc_number,
			:expire_month => cc_exp_month,
			:expire_year  => cc_exp_year,
			:cvv2         => cc_cvv2,
			:first_name   => cc_first_name,
			:last_name    => cc_last_name,
		}

		cc_address = {
			:billing_address => {
				:line1        => "52 N Main ST",
				:city         => "Johnstown",
				:state        => "OH",
				:postal_code  => "43210",
				:country_code => "US"
			}
		}

		cc_data.merge(cc_address)
		# TEST TEST TEST TEST

		# Build Payment object using Payment.new(options{}, transactions[])
		@payment = Payment.new(

			# option hash
			{
				:intent       => "sale",
				:payer        => {
					:payment_method      => "credit_card",
					:funding_instruments => [
						{
							:credit_card => {
								:type            => "visa",
								:number          => cc_number,
								:expire_month    => cc_exp_month,
								:expire_year     => cc_exp_year,
								:cvv2            => cc_cvv2,
								:first_name      => cc_first_name,
								:last_name       => cc_last_name,
								:billing_address => {
									:line1        => "52 N Main ST",
									:city         => "Johnstown",
									:state        => "OH",
									:postal_code  => "43210",
									:country_code => "US"
								}
							}
						}
					]
				},

				# an array with transaction details
				:transactions => [
					{
						:item_list   => {
							:cart_items => [
								{
									:name     => "item",
									:sku      => "item",
									:price    => "1",
									:currency => "USD",
									:quantity => 1
								}
							]
						},
						:amount      => {
							:total    => "1.00",
							:currency => "USD"
						},
						:description => "This is the payment transaction description."
					}
				]
			}
		)

		# Create Payment and return the status(true or false)
		if @payment.create
			@payment.id # Payment Id
		else
			@payment.error # Error Hash
		end
	end

	def paypal_payment
		logger.info "* * * BUY: " + params.inspect

		# ###Payment
		# A Payment Resource; create one using
		# the above types and intent as 'sale'
		@payment = Payment.new(
			{
				:intent        => "sale",

				# ###Payer
				# A resource representing a Payer that funds a payment
				# Payment Method as 'paypal'
				:payer => {
					:payment_method => "paypal"
				},

				# ###Redirect URLs   ##TODO##
				:redirect_urls => {
					:return_url => "http://localhost:3000/payment/execute",
					:cancel_url => "http://localhost:3000/"
				},

				# ###Transaction
				# A transaction defines the contract of a
				# payment - what is the payment for and who
				# is fulfilling it.
				:transactions  => [  # an array of hashes
                	{
						# Item List
						:item_list   => {
							:items => [
								{
									:name     => "item",
									:sku      => "item",
									:price    => "5",
									:currency => "USD",
									:quantity => 1
								}
							]
						},

						# ###Amount
						# Let's you specify a payment amount.
						:amount      => {
							:total    => "5",
							:currency => "USD"
						},

						:description => "This is the payment transaction description."
					}
				]
			}
		) # end of Payment.new()

		# Create Payment and return status
		if @payment.create
			# Redirect the user to given approval url
			@redirect_url = @payment.links.find { |v|
				v.method == "REDIRECT" }.href

			logger.info "Payment[#{@payment.id}]"
			logger.info "Redirect: #{@redirect_url}"

			#
			#
			#
			redirect_to :action => 'payment_history'
		else
			logger.error @payment.error.inspect
		end
	end


	def payment_history
		@payment_history = Payment.all(:count => 10)

		# List Payments
		logger.info "List Payment:"
		@payment_history.payments.each do |payment|
			logger.info "  -> Payment[#{payment.id}]"
		end

#		array_of  :funding_instruments, FundingInstrument
#		object_of :payer_info, PayerInfo


		@payment_history
	end

	def payment_execute
		# List Payments
		@payment_history = Payment.all(:count => 20)
		logger.info "*** PAYMENT EXECUTED ***"
		@payment_history.payments.each do |payment|
			logger.info "  -> Payment[#{payment.id}]"
		end
		logger.info "------------------------"
	end


	def store_credit_card

		if current_user.store_credit_card(params)
			redirect_to :back, :flash => "Invalid parameters"
		else
			redirect_to
		end
		redirect_to root_path
	end


	def show_stored_credit_card
	  @cc = PayPal::SDK::REST::DataTypes::Base::CreditCard.find("CARD-8H93797015690882YKKDDZHA")
		if @cc
			logger.info @cc.inspect
		else
			logger.info @cc.error
		end
		redirect_to root_path
	end


end

