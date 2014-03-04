class CustomersProduct < ActiveRecord::Base
  def self.from_legacy(file)
    []
  end
end
