require 'csv'

@csv_text = File.read(Rails.root.join('db', 'csv', 'products.csv'))

@csv = CSV.parse(@csv_text, :headers => true).map{|row| row.to_h}

@rows = @csv.map{|row| row.to_h}

@rows.each_with_index do |row, key|
	Product.create!(row.to_h)
end

@csv_text = File.read(Rails.root.join('db', 'csv', 'inventory.csv'))

@csv = CSV.parse(@csv_text, :headers => true).map{|row| row.to_h}

@rows = @csv.map{|row| row.to_h}

@rows.each_with_index do |row, key|
	product = Product.find_by(product_key: row['product_key'])
	product.items.create!(row.to_h)
end