class Product < ApplicationRecord
  validates :name, :brand, :sku, :model, :price, presence: true
  validates :price, numericality: true

  has_many :order_items
end
