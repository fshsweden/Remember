class Gift < ActiveRecord::Base
  belongs_to :product
  belongs_to :person
  attr_accessible :comment, :product_id, :person_id
end
