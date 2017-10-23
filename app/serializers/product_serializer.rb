class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :sku, :price, :desc, :model, :brand
end
