class MyCreditCard < ActiveRecord::Base
	belongs_to :user
	attr_accessible :user_id, :cc_cvc, :cc_exp_month, :cc_exp_year, :cc_name, :cc_number, :cc_type
	validates_presence_of :user_id, :cc_cvc, :cc_exp_month, :cc_exp_year, :cc_name, :cc_number, :cc_type
end
