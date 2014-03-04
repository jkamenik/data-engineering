# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customers_product do
    customer_id 1
    product_id 1
    quantity 1
    purchase_price 1.5
  end
end
