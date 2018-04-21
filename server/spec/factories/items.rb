# spec/factories/products.rb
FactoryBot.define do
  factory :item do
    waist { Faker::Number.number(	9) }
    length { Faker::Number.number(9) }
    product_key nil
    style { Faker::Lorem.word }
    count { Faker::Number.number(9) }
  end
end