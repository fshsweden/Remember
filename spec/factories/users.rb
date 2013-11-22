require 'faker'

FactoryGirl.define do
	factory :user do |f|
		#f.id 1
		f.email Faker::Internet::email
		f.password "abcdefgH12345"
		f.password_confirmation "abcdefgH12345"
	end
end

#attr_accessible :email,
#				:password, :password_confirmation, :current_password,
#				:remember_me,
#				:token, :token_secret
