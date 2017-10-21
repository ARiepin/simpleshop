class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.references :order_item, index: true

      t.timestamps
    end
  end
end
