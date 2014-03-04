class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name, null: false
      t.string :address
      t.string :address1
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end

    add_index :merchants, [:name, :address]
  end
end
