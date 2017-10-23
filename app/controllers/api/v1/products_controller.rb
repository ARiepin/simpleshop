class Api::V1::ProductsController < Api::V1::ApiController
  load_and_authorize_resource

  def index
    render json: @products, status: :ok
  end

  def show
    render json: @product, status: :ok
  end

  def create
    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update_price
    if @product.update_attribute(:price, params[:price])
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :brand, :model, :sku, :price, :desc)
  end
end
