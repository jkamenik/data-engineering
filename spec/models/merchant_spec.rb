require 'spec_helper'

describe Merchant do
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

    it 'tries to find a merchant by name before creating a new one' do
      create :merchant, name: test_row['merchant name']

      expect {
        Merchant.from_legacy test_row
      }.to change(Merchant,:count).by(0)
    end

    it 'saves a new product if one does not exist' do
      expect {
        Merchant.from_legacy test_row
      }.to change(Merchant,:count).by(1)
    end

    it 'pulls name from "merchant name"' do
      merch = Merchant.from_legacy test_row
      expect(merch.name).to eq test_row['merchant name']
    end

    it 'pulls address from "merchant address"' do
      merch = Merchant.from_legacy test_row
      expect(merch.address).to eq test_row['merchant address']
    end
  end
end
