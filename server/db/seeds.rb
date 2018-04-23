require 'pp'
require 'csv'

# Future plan (use upsert strategy; Only create if product names are different prevents duplicates)
puts "Seeding"
puts "Dropping records for fresh seed"

Product.destroy_all
Item.destroy_all

@csv_text = File.read(Rails.root.join('db', 'csv', 'products.csv'))

@csv = CSV.parse(@csv_text, :headers => true).map{|row| row.to_h}

@rows = @csv.map{|row| row.to_h}

@rows.each_with_index do |row, key|
	p = Product.create!(row.to_h)
	puts "Product #{p.product_name} imported"
end

@csv_text = File.read(Rails.root.join('db', 'csv', 'inventory.csv'))

@csv = CSV.parse(@csv_text, :headers => true).map{|row| row.to_h}

@rows = @csv.map{|row| row.to_h}

@rows.each_with_index do |row, key|
	product = Product.find_by(product_key: row['product_key'])
	item = product.items.create!(row.to_h)
	puts "Item for #{product.product_name} imported"
end