class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_cart
    cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart
    cart
  end
  helper_method :current_cart
end
