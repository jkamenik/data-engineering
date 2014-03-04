class CustomersProduct < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product

  validates :customer_id, presence: true
  validates :product_id, presence: true
  validates :quantity, presence: true
  validates :purchase_price, presence: true

  def self.from_legacy(file)
    []
  end

  def total_price
    quantity * purchase_price
  end
end
