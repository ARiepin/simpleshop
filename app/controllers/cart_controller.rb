class CartController < ApplicationController
  before_action :set_cart, only: %i(add_item delete_item index order)

  def index
    @items = @cart.items_for_cart
  end

  def add_item
    @cart.add_item_to_cart(params[:product_id])
    @items = @cart.items_for_cart
  end

  def delete_item
    @cart.delete_item(params[:product_id])
    @items = @cart.items_for_cart
    redirect_back(fallback_location: cart_index_path)
  end

  def order
    @items = @cart.items_for_order
    order = Order.new(user: current_user, order_items_attributes: @items)

    if order.save!
      flash[:success] = 'Order has been created successfully'
      @cart.empty
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to root_path
    end
  end

  private

  def set_cart
    @cart = Cart.new(session)
  end
end
