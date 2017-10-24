require 'rails_helper'

describe 'Products API' do
  it 'returns all the products' do
    FactoryGirl.create_list(:product, 5)
    get '/api/v1/products'

    expect(response.status).to eql(200)
    expect(json.size).to eq(5)
  end

  it 'returns a specific product' do
    product = FactoryGirl.create(:product)
    get "/api/v1/products/#{product.id}"
    serialized = serialize(product)

    expect(response.status).to eql(200)
    expect(json).to eq(serialized)
  end
end
