class Product < ActiveRecord::Base
  validates :name, presence: true, uniqueness: {scope: :merchant_id}
  validates :price, presence: true

  belongs_to :merchant

  def self.from_legacy(row)
    merch = Merchant.from_legacy row
    prod = self.where(name: row['item description'], merchant_id: merch.id).first

    unless prod
      prod = self.new name: row['item description'], price: row['item price']
      prod.merchant = merch
      prod.save
    end

    prod
  end
end
