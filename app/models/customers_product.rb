require 'csv'

class CustomersProduct < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product

  validates :customer_id, presence: true
  validates :product_id, presence: true
  validates :quantity, presence: true
  validates :purchase_price, presence: true

  def self.from_legacy_csv(file)
    items = []
    CSV.foreach(file, col_sep: "\t", headers: :first_row) do |row|
      items.push self.from_legacy row
    end
    items
  end

  def self.from_legacy(row)
    raise TypeError unless row

    cp                = self.new
    cp.customer       = Customer.from_legacy row
    cp.product        = Product.from_legacy row
    cp.quantity       = row['purchase count'].to_i
    cp.purchase_price = row['item price'].to_f
    cp.save
    cp
  end

  def total_price
    quantity * purchase_price
  end
end
