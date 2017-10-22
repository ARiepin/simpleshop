class Cart
  def initialize(session)
    @session = session
    @cart = @session[:cart] || {}
  end

  # Add item to cart
  def add_item(product_id)
    @cart[product_id].blank? ? @cart[product_id] = 1 : @cart[product_id] += 1
    @session[:cart] = @cart
  end

  # Delete item from cart
  def delete_item(product_id)
    if @cart[product_id].present?
      @cart[product_id] > 1 ? @cart[product_id] -= 1 : @cart.delete(product_id)
    end
    @session[:cart] = @cart
  end

  # Empty cart
  def empty
    @session[:cart] = nil
  end

  # Display items in cart
  def items_for_cart
    @cart.map do |key, value|
      product = Product.find_by(id:key)
      if product.present?
        {
          id: product.id,
          name: product.name,
          brand: product.brand,
          model: product.model,
          sku: product.sku,
          price: product.price,
          quantity: value,
          total_item_price: product.price * value
        }
      else
        nil
      end
    end
  end

  # Items for order
  def items_for_order
    @cart.map do |key, value|
      {
        product_id: key,
        quantity: value
      }
    end
  end
end
