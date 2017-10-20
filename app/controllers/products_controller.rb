class ProductsController < ApplicationController
  load_and_authorize_resource

  def index
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
end
