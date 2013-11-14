class User < ActiveRecord::Base

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,
                  :password, :password_confirmation, :current_password,
                  :remember_me,
                  :token, :token_secret
  # attr_accessible :title, :body

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :rememberable,:database_authenticatable,:registerable, :omniauth_providers => [:facebook, :twitter, :google_oauth2]
				 #,:recoverable,
         #,:trackable
         #,:validatable

  validates_uniqueness_of :email, :on => "create", :message => "Email must be unique"

  #
  #
  #
  has_many :authentications, :dependent => :destroy

  #
  # C R E D I T   C A R D S (NOT USED)
  #
  has_many :credit_cards, :dependent => :destroy
  accepts_nested_attributes_for :credit_cards, :allow_destroy => true
  attr_accessible :credit_cards_attributes

  #
  #  C A R D S
  #
  has_many :cards, :dependent => :destroy
  accepts_nested_attributes_for :cards, :allow_destroy => true
  attr_accessible :cards_attributes

  #
  # C L I E N T S  (that we (the user) administrates)
  #
  has_and_belongs_to_many :clients, :class_name => 'Person'
  accepts_nested_attributes_for :clients, :allow_destroy => true
  attr_accessible :clients_attributes

  def apply_omniauth(omni)
    authentications.build(:provider     => omni['provider'],
                          :uid          => omni['uid'],
                          :token        => omni['credentials'].token,
                          :token_secret => omni['credentials'].secret)
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super #&& provider.blank?
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
		                     email: data["email"],
		                     password: Devise.friendly_token[0,20]
		  )
	  end
	  user
  end

end
