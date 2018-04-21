# spec/factories/products.rb
FactoryBot.define do
  factory :item do
    waist { Faker::Number.number(9999) }
    length { Faker::Number.number(9999) }
    product_id nil
    style { Faker::Lorem.word }
    count { Faker::Number.number(9999) }
  end
end