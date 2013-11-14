class AuthenticationsController < ApplicationController

	before_filter :check_logged_in

	def check_logged_in
		logger.info "AuthenticationsController parameters:" + params.inspect
	end

	def index
		if current_user
			@authentications = Authentication.where(:user_id => current_user.id)
		else
			redirect_to welcome_index_path
		end

	end

	def home

	end

	def failure
		render "auth_error"
	end

	def google_oauth2
		# You need to implement the method below in your model (e.g. app/models/user.rb)
		@user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

		if @user.persisted?
			flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
			sign_in_and_redirect @user, :event => :authentication
		else
			session["devise.google_data"] = request.env["omniauth.auth"]
			redirect_to new_user_registration_url
		end
	end


	def twitter
		omni = request.env["omniauth.auth"]
		logger.info request.env["omniauth.auth"].to_xml

		authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])
		if authentication
			# This Twitter user already exists
			flash[:notice] = "Logged in Successfully"
			sign_in_and_redirect User.find(authentication.user_id)
		elsif current_user
			# Twitter uid not found but we ARE logged in so add Twitter auth!
			token = omni['credentials'].token
			token_secret = omni['credentials'].secret

			current_user.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :token_secret => token_secret)
			flash[:notice] = "Authentication successful."
			sign_in_and_redirect current_user
		else

			session[:twitter_data] = omni.except('extra') # extra makes it too big!

			# We MUST complete with an e-mail address!  (why really?)
			# render "add_email"

			# Twitter uid not found so create a new User and add Twitter auth!
			user = User.find_by_username(omni['info']['nickname']) || User.new
			user.apply_omniauth(omni)

			if user.save
				flash[:notice] = "Logged in."
				sign_in_and_redirect User.find(user.id)
				#else
				#  session[:omniauth] = omni.except('extra')
				#  redirect_to new_user_registration_path
				#end

			end
		end
	end

	def facebook

		logger.info "- callback from facebook ----------------------------------------------"

		#logger.info "- callback from facebook authentication DUMP of 'info' 1)----------------------------------------------"
		#hash = request.env["omniauth.auth"].info
		#hash.each do |key, value|
		#  logger.info "#{key} = #{value}"
		#end
		#logger.info "- callback from facebook authentication DUMP of 'extra.raw_info' 2) -----------------------------------"
		#hash = request.env["omniauth.auth"].extra.raw_info
		#hash.each do |key, value|
		#  logger.info "#{key} = #{value}"
		#end

		omni = request.env["omniauth.auth"]

		if params['error_code']
			render "auth_error", params
		else

			logger.info "- callback from facebook authentication LOOKING up facebook + #{omni['uid']} --------------------------"

			authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])
			if authentication
				logger.info "- callback from facebook authentication FOUND facebook + #{omni['uid']} -----------------------------"
				flash[:notice] = "Logged in Successfully"
				sign_in_and_redirect User.find(authentication.user_id)
			elsif current_user
				logger.info "- callback from facebook authentication DIDN'T FIND facebook + #{omni['uid']} BUT CURRENT_USER ------"
				token = omni['credentials'].token
				token_secret = omni['credentials'].secret

				current_user.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :token_secret => token_secret)
				flash[:notice] = "Authentication successful."
				sign_in_and_redirect current_user
			else
				logger.info "- callback from facebook authentication DIDN'T FIND facebook + #{omni['uid']} AND NO CURRENT_USER ---"

				user = User.find_by_email(omni['extra']['raw_info']['email']) || User.new

				user.email = omni['extra']['raw_info']['email']
				user.apply_omniauth(omni)

				if user.save
					logger.info "- Saved User OK - sign_in_and_redirect ---"
					flash[:notice] = "Logged in."
					sign_in_and_redirect User.find(user.id)
				else
					logger.info "- Couldnt save User.... - storing omni[] array ---"
					session[:omniauth] = omni.except('extra')
					redirect_to new_user_registration_path
				end

			end

			session[:omniauth] = omni.except('extra')

		end
	end

	def create
		@authentication = Authentication.new(params[:authentication])
		if @authentication.save
			redirect_to authentications_url, :notice => "Successfully created authentication."
		else
			render :action => 'new'
		end
	end

	def destroy
		@authentication = Authentication.find(params[:id])
		@authentication.destroy
		redirect_to authentications_url, :notice => "Successfully destroyed authentication."
	end
end
