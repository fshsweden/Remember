class Photo < ActiveRecord::Base
  attr_accessible :description, :location, :title, :image
  belongs_to :person
  has_attached_file :image, :styles => { :large => "600x600", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
