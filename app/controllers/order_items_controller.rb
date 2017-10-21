class OrderItemsController < ApplicationController
  load_and_authorize_resource

  def create
    if current_cart.order_items.where(product_id: params[:product_id]).any?
      order_item = current_cart.order_items.where(product_id: params[:product_id]).first
      order_item.quantity += 1
    else
      order_item = Order_Item.new
      order_item.cart = current_cart
      product = Product.find(params[:product_id])
      order_item.product = product
      order_item.quantity = 1
      order_item.price = product.price
    end

    if order_item.save
      redirect_to carts_path, notice: 'Product was added to cart'
    else
      redirect_to carts_path, alert: 'Something went wrong'
    end
  end

  def destroy
    @order_item.destroy
    redirect_back
  end
end
