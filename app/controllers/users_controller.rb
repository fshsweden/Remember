class UsersController < ApplicationController
	def edit
		if !current_user
			redirect_to root_path
		end
	end

	def update
		if !current_user
			redirect_to root_path
		else
			current_user.save!
		end
	end

	def store_credit_card (number, type, expmonth, expyear, cvv2, first_name, last_name, billing_addr_hash)

		@cc = MyCreditCard.new({
			:number => number,
			:type => type,
			:expire_month => expmonth,
			:expire_year => expyear,
			:cvv2 => cvv2,
			:first_name => first_name,
			:last_name => last_name,
			:billing_address => {
				:line1 => billing_addr_hash['line1'],
				:city => billing_addr_hash['city'],
				:state => billing_addr_hash['state'],
				:postal_code => billing_addr_hash['postal_code'],
				:country_code => billing_addr_hash['country_code']
			}
		})

		if @cc.create
			logger.info @cc.id + ": Credit Card stored in vault!"
			#logger.info @cc.inspect
		else
			logger.info "FAILED TO : Credit Card stored in vault!"
			logger.info @cc.error

			puts @cc.error.name
			puts @cc.error.message
			puts @cc.error.information_link
			puts @cc.error.debug_id
			@cc.error.details.each do |e|
				puts e.field + " = " + e.issue
			end
		end
	end

end
