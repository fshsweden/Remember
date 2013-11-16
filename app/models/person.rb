class Person < ActiveRecord::Base
  attr_accessible :name, :surname

  validates_presence_of :surname, :name

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

  #
  #
  #
  has_many :gifts
  has_many :products, :through => :gifts
  accepts_nested_attributes_for :products, :allow_destroy => true
  attr_accessible :products_attributes

  has_many :photos
  accepts_nested_attributes_for :photos, :allow_destroy => true
  attr_accessible :photos_attributes

  has_many :stories
  accepts_nested_attributes_for :stories, :allow_destroy => true
  attr_accessible :stories_attributes

  def fullname
    "#{name} #{surname}"
  end

  def fullname_surname_first
	  "#{surname}, #{name}"
  end

  def get_primary_photo_tag
    if photos && photos.count > 0
      image_tag(photos.first.image.url(:thumb))
    else
      ''
    end
  end

end
