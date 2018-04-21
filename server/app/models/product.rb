class Product < ApplicationRecord
	has_many :items, dependent: :destroy
	# validations
  validates_presence_of :product_key, :product_name, :product_image, :product_description

  scope :with_product_name, proc { |product_name|
    if product_name.present?
      where("product_name LIKE ?", "%#{product_name}%")
    end
  }

  def self.search(product_name: nil)
    with_product_name(product_name)
  end

end
