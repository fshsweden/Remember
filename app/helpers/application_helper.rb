module ApplicationHelper
  def title(page_title)
    content_for :title, page_title.to_s
  end


  # ---------------------------------------------------------------------------------
  # Cart and CartItem
  # ---------------------------------------------------------------------------------
  def current_cart
	  if session[:cart_id]

		  @current_cart ||= Cart.find_by_id(session[:cart_id])
		  # Time to start a new cart?
		  if @current_cart && @current_cart.purchased_at
			  session[:cart_id] = nil
		  end
	  end
	  if session[:cart_id].nil?
		  @current_cart = Cart.create!
		  session[:cart_id] = @current_cart.id
	  end
	  @current_cart
  end

  def clear_cart
	  session[:cart_id] = nil
  end

end
