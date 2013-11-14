class CartItem < ActiveRecord::Base
  attr_accessible :price, :qty, :references, :cart_id, :product_id, :person_id, :qty
  belongs_to :cart
  belongs_to :product
  belongs_to :person
end
