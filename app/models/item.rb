class Item < ApplicationRecord
  belongs_to :product
  validates_presence_of :product_id, :waist, :length, :style, :count
end
