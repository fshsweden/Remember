class UpdateAction < ActiveRecord::Base
  belongs_to :person
  attr_accessible :person_id, :comment
end
