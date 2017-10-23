class ProductsController < ApplicationController
  load_and_authorize_resource except: :add_to_cart

  def index
  end

  def create
    if @product.save
       flash[:notice] = 'Product has been added'
    else
      flash[:error]  = @product.errors.full_messages.to_sentence
    end
    redirect_to products_path
  end

  def import
    begin
      file = File.read(params.dig(:products, :file).path)
      data = JSON.parse(file)
      ApplicationRecord.transaction do
        Product.create!(data['products'])
      end

      flash['success'] = 'Products have been successfully imported'
      redirect_to root_path
    rescue
      flash[:error] = 'Something went wrong'
      redirect_back(fallback_location: root_path)
    end
  end

  def add_to_cart
    product_id = params[:id]
    cart = Cart.new(session)
    cart.add_item(product_id)
    redirect_back(fallback_location: root_path)
  end

  private

  def product_params
    params.require(:product).permit(:name, :desc, :price, :sku, :model, :brand)
  end
end
