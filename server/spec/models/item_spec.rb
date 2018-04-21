require 'rails_helper'

RSpec.describe Item, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:product) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:product_key) }
  it { should validate_presence_of(:waist) }
  it { should validate_presence_of(:length) }
  it { should validate_presence_of(:style) }
  it { should validate_presence_of(:count) }
end
