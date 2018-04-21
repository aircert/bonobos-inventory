# spec/factories/products.rb
FactoryBot.define do
  factory :product do
    product_id { Faker::Number.number(4) }
    product_name { Faker::Lorem.word }
    product_image { Faker::Lorem.word }
    product_description { Faker::Lorem.word }
  end
end