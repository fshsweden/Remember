class Person < ActiveRecord::Base
  attr_accessible :name, :surname

  #
  # Always these three together!
  #
  has_many :events
  accepts_nested_attributes_for :events, :allow_destroy => true
  attr_accessible :events_attributes

  #
  # Always these three together!
  #
  has_and_belongs_to_many :admins, :class_name => 'User'
  accepts_nested_attributes_for :admins, :allow_destroy => true
  attr_accessible :admins_attributes

  #
  #
  #
  has_many :clicks
  has_many :users, :through => :clicks
  accepts_nested_attributes_for :users, :allow_destroy => true
  attr_accessible :users_attributes

  #
  #
  #
  has_many :gifts
  has_many :products, :through => :gifts
  accepts_nested_attributes_for :products, :allow_destroy => true
  attr_accessible :products_attributes


  def fullname
    "#{name} #{surname}"
  end

end
