class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :authentications, :dependent => :destroy

  has_many :credit_cards, :dependent => :destroy
  accepts_nested_attributes_for :credit_cards, :allow_destroy => true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :credit_cards_attributes, :email, :password, :password_confirmation, :remember_me, :token, :token_secret
  # attr_accessible :title, :body

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
end
