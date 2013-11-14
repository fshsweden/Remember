# spec/models/contact.rb
 require 'spec_helper'

 describe CreditCard do
	it "has a valid factory" do
		FactoryGirl.create(:credit_card).should be_valid
	end
	it "is invalid without a user_id" do
		FactoryGirl.build(:credit_card, user_id: nil).should_not be_valid
	end
	it "is invalid without a cc_cvc" do
		FactoryGirl.build(:credit_card, cc_cvc: nil).should_not be_valid
	end
	it "is invalid without a cc_exp_month" do
		FactoryGirl.build(:credit_card, cc_exp_month: nil).should_not be_valid
	end
	it "is invalid without a cc_exp_year" do
		FactoryGirl.build(:credit_card, cc_exp_year: nil).should_not be_valid
	end
	it "is invalid without a cc_name" do
		FactoryGirl.build(:credit_card, cc_name: nil).should_not be_valid
	end
	it "is invalid without a cc_number" do
		FactoryGirl.build(:credit_card, cc_number: nil).should_not be_valid
	end
	it "is invalid without a cc_type" do
		FactoryGirl.build(:credit_card, cc_type: nil).should_not be_valid
	end
	it "returns a credit cards full details as a string" do

	end
 end