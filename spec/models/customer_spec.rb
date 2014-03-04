require 'spec_helper'

describe Customer do
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

    it 'tries to find a customer by name before creating a new one' do
      cust = create :customer, name: test_row['purchaser name']

      expect {
        Customer.from_legacy test_row
      }.to change(Customer,:count).by(0)
    end

    it 'saves a new customer if one does not exist' do
      expect {
        Customer.from_legacy test_row
      }.to change(Customer,:count).by(1)
    end

    it 'pulls name from "purchaser name"' do
      cust = Customer.from_legacy test_row
      expect(cust.name).to eq test_row['purchaser name']
    end
  end
end
