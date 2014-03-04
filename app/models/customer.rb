class Customer < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  def self.from_legacy(row)
    cust = self.where(name: row['purchaser name']).first

    unless cust
      cust = self.new name: row['purchaser name']
      cust.save
    end

    cust
  end
end
