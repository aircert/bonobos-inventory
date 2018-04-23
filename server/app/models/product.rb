class Product < ApplicationRecord
	has_many :items, dependent: :destroy
	# validations
  validates_presence_of :product_key, :product_name, :product_image, :product_description
  
  # Currently filters on front end... For some reason a bug exist
  # SQL LIKE not returning expected result. Test in rspec is failing as well
  scope :with_product_name, proc { |product_name|
    if product_name.present?
      words = product_name.to_s.strip.split
      words.map! { |word| "product_name LIKE '%#{word}%'" }
      sql = words.join(" AND ")
      where(sql)
    end
  }

  def self.search(product_name: nil)
    with_product_name(product_name)
  end

end
