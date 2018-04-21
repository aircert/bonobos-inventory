# spec/factories/products.rb
FactoryBot.define do
  factory :product do
    trait :product_key
    product_name { Faker::Lorem.word }
    product_image { Faker::Lorem.word }
    product_description { Faker::Lorem.word }
  end
end