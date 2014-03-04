require 'spec_helper'

describe CustomersProduct do
  context '#from_legacy' do
    it 'errors if no file is provided'

    it 'returns a list of created purchases'

    it 'calls "from_legacy" on customers'

    it 'calls "from_legacy" on products'

    it 'calls "from_legacy" on merchants'
  end

  context '.total_price' do
    it 'returns price * quantity' do
      cp = build :customers_product, quantity: 2, purchase_price: 2.2

      expect(cp.total_price).to eq 4.4
    end
  end
end
