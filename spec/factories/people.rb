require 'faker'

FactoryGirl.define do
	factory :person do |f|
		f.name Faker::Name.first_name
		f.surname Faker::Name.last_name
	end
end
