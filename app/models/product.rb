class Product < ApplicationRecord
	has_many :items, dependent: :destroy
	# validations
  validates_presence_of :product_id, :product_name, :product_image, :product_description
end
