require 'faker'

FactoryGirl.define do
	factory :place do |f|
		 f.description Faker::Address.street_address
		 after_create do |p|
			 p.people = create_list(:person, 4)
		 end
	end
end
