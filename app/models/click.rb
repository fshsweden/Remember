class Click < ActiveRecord::Base
  belongs_to :person
  attr_accessible :person_id, :count
end