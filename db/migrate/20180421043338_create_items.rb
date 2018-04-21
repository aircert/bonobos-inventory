class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :waist
      t.integer :length
      t.references :product, foreign_key: true
      t.string :style
      t.integer :product_key
      t.integer :count

      t.timestamps
    end
  end
end
