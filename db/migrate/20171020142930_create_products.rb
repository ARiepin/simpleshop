class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.text :name
      t.text :brand
      t.text :model
      t.text :sku
      t.integer :price
      t.text :desc
      t.timestamps
    end
  end
end
