require 'spec_helper'

describe CustomersProduct do
  context '#from_legacy_csv' do
    let(:test_file) {Rails.root.join('spec','files','example_input.tab')}

    it 'errors if no file is provided' do
      expect {
        CustomersProduct.from_legacy_csv nil
      }.to raise_error TypeError
    end

    it 'returns a list of created purchases' do
      items = CustomersProduct.from_legacy_csv test_file
      expect(items).to be_an Array
      expect(items.size).to eq 4
    end
  end

  context '#from_legacy' do
    let(:test_row) do
      {
        'purchaser name'   => 'Snake Plissken',
        'item description' => '$10 off $20 of food',
        'item price'       => '10.0',
        'purchase count'   => '2',
        'merchant address' => '987 Fake St',
        'merchant name'    => "Bob's Pizza"
      }
    end

    it 'errors if no data is provided' do
      expect {
        CustomersProduct.from_legacy nil
      }.to raise_error TypeError
    end
    
    it 'skips invalid rows' do
      test_row['item description'] = nil
      
      item = CustomersProduct.from_legacy test_row
      expect(item.total_price).to eq 0
    end

    it 'pulls quantity from "purchase count"' do
      cp = CustomersProduct.from_legacy test_row

      expect(cp.quantity).to eq 2
    end

    it 'pulls purchase_price from "item price"' do
      cp = CustomersProduct.from_legacy test_row

      expect(cp.purchase_price).to eq 10.0
    end

    it 'calls "from_legacy" on customers' do
      expect(Customer).to receive(:from_legacy)
      CustomersProduct.from_legacy test_row
    end

    it 'calls "from_legacy" on products' do
      expect(Product).to receive(:from_legacy)
      CustomersProduct.from_legacy test_row
    end

    it 'calls "from_legacy" on merchants' do
      expect(Merchant).to receive(:from_legacy).and_return create(:merchant)
      CustomersProduct.from_legacy test_row
    end
  end

  context '.total_price' do
    it 'returns price * quantity' do
      cp = build :customers_product, quantity: 2, purchase_price: 2.2

      expect(cp.total_price).to eq 4.4
    end
  end
end
