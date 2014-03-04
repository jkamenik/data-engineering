# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    sequence(:name) {|n| "Product #{"%05d" % n}"}
    price           1.5
  end
end
