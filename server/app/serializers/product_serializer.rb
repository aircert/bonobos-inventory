class ProductSerializer < ActiveModel::Serializer
   # attributes to be serialized  
  attributes :id, :product_key, :product_name, :product_image, :product_description
  # model association
  has_many :items
end
