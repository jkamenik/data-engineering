# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :merchant do
    sequence(:name) {|n| "Merchant #{"%05d" % n}"}
    address         '1 Main St.'
    address1        ''
    city            ''
    state           ''
    zip             ''
  end
end
