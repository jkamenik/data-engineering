# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customers_product do
    quantity       1
    purchase_price 1.5

    association :customer
    association :product
  end
end
