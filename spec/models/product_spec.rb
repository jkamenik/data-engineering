require 'spec_helper'

describe Product do
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

    it 'tries to find a product by name and merch before creating a new one' do
      merch = create :merchant, name: test_row['merchant name']
      cust  = create :product, name: test_row['item description'], merchant: merch

      expect {
        Product.from_legacy test_row
      }.to change(Product,:count).by(0)
    end

    it 'saves a new product if one does not exist' do
      expect {
        Product.from_legacy test_row
      }.to change(Product,:count).by(1)
    end

    it 'pulls name from "item description"' do
      prod = Product.from_legacy test_row
      expect(prod.name).to eq test_row['item description']
    end

    it 'pulls price from "item price"' do
      prod = Product.from_legacy test_row
      expect(prod.price).to eq test_row['item price'].to_f
    end

    it 'calls "from_legacy" on merchants' do
      expect(Merchant).to receive(:from_legacy).and_return create(:merchant)
      Product.from_legacy test_row
    end
  end
end
