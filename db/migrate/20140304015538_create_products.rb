class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :merchant_id, null: false
      t.string  :name,        null: false
      t.float   :price,       null: false

      t.timestamps
    end

    add_index :products, [:merchant_id,:name], unique: true
  end
end
