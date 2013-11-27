class Yard < ActiveRecord::Base
	attr_accessible :lat, :lng, :name

	# A Yard has many Places
	has_many :yard_locations
	has_many :places, :through => :yard_locations
end
