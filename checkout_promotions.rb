# checkout_promotions.rb
# actual main part of the cod using all of the above
require_relative 'item'
require_relative 'checkout'
require_relative 'promotion_rule'

# initiation of the promotion_rules
promotion_rules = [
	LowerPriceWhenMoreThanX.new(
		Item.new(001, 'Lavender heart', 9.25), 
		2,
		8.50
		),
	DiscountIfOverThreshold.new(
		60,
		0.1
		)
]

def catalogue 
	item_options = [
		Item.new(001, 'Lavender heart', 9.25),
		Item.new(002, 'Personalised cufflinks', 45.00),
		Item.new(003, 'Kids T-shirt', 19.95)
	]
	return item_options
end

item1, item2, item3 = catalogue

# case when total > 60 GBP and two items with modified price
co = Checkout.new(promotion_rules)
co.scan(item1)
co.scan(item2)
co.scan(item3)
co.scan(item1)
price = co.total
puts 'Price > 60 GBP and 2 Lavender hearts. Total: ' + price.to_s

item1, item2, item3 = catalogue

# case when total > 60 GBP
co = Checkout.new(promotion_rules)
co.scan(item1)
co.scan(item2)
co.scan(item3)
price = co.total
puts 'Price > 60 GBP. Total: ' + price.to_s

item1, item2, item3 = catalogue

# case with two item with updated price
co = Checkout.new(promotion_rules)
co.scan(item1)
co.scan(item1)
co.scan(item3)
price = co.total
puts '2 Lavender hearts. Total: ' + price.to_s
