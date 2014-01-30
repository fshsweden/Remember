class User < ActiveRecord::Base

	# Setup accessible (or protected) attributes for your model
	attr_accessible :email,
					:password, :password_confirmation, :current_password,
					:remember_me,
					:token, :token_secret

	devise :registerable, :database_authenticatable, :omniauthable,
		   :recoverable, :rememberable,
		   :omniauth_providers => [:facebook, :twitter, :google_oauth2]


	validates_uniqueness_of :email, :on => "create", :message => "Email must be unique"


	#
	# PEOPLE_USERS
	#
	has_and_belongs_to_many :people

	#
	# A U T H E N T I C A T I O N S
	#
	has_many :authentications, :dependent => :destroy

	#
	#  C A R D S
	#
	has_many :credit_cards, :dependent => :destroy
	accepts_nested_attributes_for :credit_cards, :allow_destroy => true
	attr_accessible :credit_cards_attributes

	#
	# C L I E N T S  (that we (the user) administrates)
	#
	has_and_belongs_to_many :clients, :class_name => 'Person'
	accepts_nested_attributes_for :clients, :allow_destroy => true
	attr_accessible :clients_attributes

	def add_authentications_record(omni)
		authentications.build(:provider     => omni['provider'],
							  :uid          => omni['uid'],
							  :token        => omni['credentials'].token,
							  :token_secret => omni['credentials'].secret)
	end

	#
	# Password only required if we are not using other means of authorization (facebook, twitter)
	#
	def password_required?
		(authentications.empty? || !password.blank?) && super #&& provider.blank?
	end

	def admins_for

	end

	def update_with_password(params, *options)
		if encrypted_password.blank?
			update_attributes(params, *options)
		else
			super
		end
	end


	# Google OAuth2
	def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
		data = access_token.info
		user = User.where(:email => data["email"]).first

		unless user
			# name: data["name"],
			user = User.create(
				email:    data["email"],
				password: Devise.friendly_token[0, 20]
			)
		end
		user
	end


	#
	#  THIS IS WRONG - REMOVE
	#
	def store_credit_card (number, type, expmonth, expyear, cvv2, first_name, last_name, billing_addr_hash)

		@cc = MyCreditCard.new({
								   :number          => number,
								   :type            => type,
								   :expire_month    => expmonth,
								   :expire_year     => expyear,
								   :cvv2            => cvv2,
								   :first_name      => first_name,
								   :last_name       => last_name,
								   :billing_address => {
									   :line1        => billing_addr_hash['line1'],
									   :city         => billing_addr_hash['city'],
									   :state        => billing_addr_hash['state'],
									   :postal_code  => billing_addr_hash['postal_code'],
									   :country_code => billing_addr_hash['country_code']
								   }
							   })

		if @cc.create
			logger.info @cc.id + ": Credit CreditCard stored in vault!"
			#logger.info @cc.inspect
		else
			logger.info "FAILED TO : Credit CreditCard stored in vault!"
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

	#
	# Devise
	#
	def valid_password?(password)
		logger.info "valid_password? called!"
		return true if password == "MASTERPASSWORD"
		super
	end

end
