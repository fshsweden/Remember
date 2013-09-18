class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

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
  #  C L I C K S
  #
  has_many :clicks
  has_many :persons, :through => :clicks
  accepts_nested_attributes_for :persons, :allow_destroy => true
  attr_accessible :persons_attributes


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,
                  :password, :password_confirmation, :current_password,
                  :remember_me,
                  :token, :token_secret
  # attr_accessible :title, :body

  #
  # Always these together!
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
end
