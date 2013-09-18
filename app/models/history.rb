class History < ActiveRecord::Base
  belongs_to :user
  attr_accessible :person_id, :when
end
