class CreateCustomersProducts < ActiveRecord::Migration
  def change
    create_table :customers_products do |t|
      t.integer :customer_id
      t.integer :product_id
      t.integer :quantity
      t.float :purchase_price

      t.timestamps
    end
  end
end
