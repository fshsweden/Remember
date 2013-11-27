class Person < ActiveRecord::Base

	attr_accessible			:name, :surname
	validates_presence_of	:name, :surname

	#
	# A Person has many Events
	#
	has_many :events
	accepts_nested_attributes_for :events, :allow_destroy => true
	attr_accessible :events_attributes

	#
	# A Person has many Admins
	#
	has_and_belongs_to_many :admins, :class_name => 'User'
	accepts_nested_attributes_for :admins, :allow_destroy => true
	attr_accessible :admins_attributes

	#
	# A Person has many Clicks
	#
	has_many :clicks

	#
	# A Person has many Gifts (given by User or Guest?)
	#
	has_many :gifts
	has_many :products, :through => :gifts
	accepts_nested_attributes_for :products, :allow_destroy => true
	attr_accessible :products_attributes

	#
	# A Person has many Photos
	#
	has_many :photos
	accepts_nested_attributes_for :photos, :allow_destroy => true
	attr_accessible :photos_attributes

	#
	# A Person has many Stories
	#
	has_many :stories
	accepts_nested_attributes_for :stories, :allow_destroy => true
	attr_accessible :stories_attributes

	#
	# A Person has many Places
	#
	has_many :person_places
	has_many :places, :through => :person_places


	def fullname
		"#{name} #{surname}"
	end

	def fullname_surname_first
		"#{surname}, #{name}"
	end

	def add_event(argument_hash)
		evt = Event.new(argument_hash)
		events << evt
		save
	end

	def find_event(name)
		events.where(:name => name).first  # shouldnt be more than one anyway
	end

	def add_photo(p)

	end

	def get_primary_photo_tag
		if photos && photos.count > 0
			image_tag(photos.first.image.url(:thumb))
		else
			''
		end
	end

	def add_story(argument_hash)
		story = Story.new(argument_hash)
		stories << story
		save
	end

	def add_music

	end

	def add_video

	end

end
