# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    sequence(:name) {|x| "Customer #{"%05d" % n}"}
  end
end
