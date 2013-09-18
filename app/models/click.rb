class Click < ActiveRecord::Base
  belongs_to :user
  belongs_to :person
  attr_accessible :person_id, :user_id, :count
end