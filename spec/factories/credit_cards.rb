require 'faker'

FactoryGirl.define do
	factory :credit_card do |f|
		f.user_id 1
		f.cc_cvc 428
		f.cc_exp_month "12"
		f.cc_exp_year "15"
		f.cc_name Faker::Name.name
		f.cc_number Faker::Business.credit_card_number
		f.cc_type Faker::Business.credit_card_type
	end
end
