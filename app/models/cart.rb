class Cart < ActiveRecord::Base

  has_many :cart_items
  accepts_nested_attributes_for :cart_items, :allow_destroy => true
  attr_accessible :cart_items

  def add_item(product_id, person_id)
    item = cart_items.where('product_id = ? and person_id = ?', product_id, person_id).first
    if item
      # increase the quantity of product in cart
      item.qty = item.qty + 1
      item.save
    else
      # product does not exist in cart
      product = Product.find(product_id)
      cart_items << CartItem.new(product_id: product_id, person_id: person_id, qty: 1, price: product.price)
    end
    save
  end

  def remove_item(product_id, person_id)
    item = cart_items.where('product_id = ? and person_id = ?', product_id, person_id).first
    if item
      logger.info "Found cart item #{item.id}"
      item.destroy
      save
    else
      logger.info "cart item #{product_id} / #{person_id} NOT FOUND *******************"
      cart_items.each do |c|
        logger.info "Existing cart item #{c.id} #{c.product_id} #{c.person_id} *******************"
      end
    end
  end

  def total_price
    cart_items.to_a.sum(&:price)
  end

end

