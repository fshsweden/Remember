# spec/models/contact.rb
require 'spec_helper'

describe User do

	it "can register a credit card" do

	  @user = FactoryGirl.create :user
	  sign_in @user

		@cc = current_user.store_credit_card(
			 :number => "4024007151371111ss4",
			 :type => "visa",
			 :expire_month => "11",
			 :expire_year => "2015",
			 :cvv2 => "428",
			 :first_name => "Peter",
			 :last_name => "Andersson",
			 :billing_address => {
				 :line1 => "Mackmyra byväg 36",
				 :city => "Valbo",
				 :state => "OH",
				 :postal_code => "81832",
				 :country_code => "SE"
			 }
		 )

	end
end
