class Place < ActiveRecord::Base
	attr_accessible :description

	# Can one Place exists n many yards? Probably not
	# But one Person can exist in many Places
	belongs_to :yard

	has_many :people, :through => :person_places   # HABTM would be people_places!

	def add_person(person)
		people << person
	end
end
