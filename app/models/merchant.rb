class Merchant < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  def self.from_legacy(row)
    merch = self.where(name: row['merchant name']).first

    unless merch
      merch = self.new name: row['merchant name'], address: row['merchant address']
      merch.save!
    end

    merch
  end
end
