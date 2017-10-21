class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :product, index: true
      t.references :order, index: true
      t.references :cart, index: true

      t.timestamps
    end
  end
end
