class Product < ActiveRecord::Base

  attr_accessible :category_id, :name
  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :categories, :allow_destroy => true
  attr_accessible :categories_attributes

  has_many :gifts
  has_many :people, :through => :gifts
  #accepts_nested_attributes_for :products, :allow_destroy => true
  attr_accessible :people_attributes

end
