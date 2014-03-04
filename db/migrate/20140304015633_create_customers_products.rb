class CreateCustomersProducts < ActiveRecord::Migration
  def change
    create_table :customers_products do |t|
      t.integer :customer_id,  null: false
      t.integer :product_id,   null: false
      t.integer :quantity,     null: false
      t.float :purchase_price, null: false

      t.timestamps
    end
  end
end
