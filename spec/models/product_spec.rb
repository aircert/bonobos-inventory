require 'rails_helper'

RSpec.describe Product, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should have_many(:items).dependent(:destroy) }
  # Validation tests
  it { should validate_presence_of(:product_key) }
  it { should validate_presence_of(:product_name) }
  it { should validate_presence_of(:product_image) }
  it { should validate_presence_of(:product_description) }
  # it { should validate_presence_of(:created_by) }
end
