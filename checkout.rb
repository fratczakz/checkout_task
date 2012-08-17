# checkout.rb

# class for scanning items and calculating the total 
class Checkout
	attr_accessor :item_list
	def initialize(promotion_rules)
		@promotion_rules = promotion_rules
		@item_list = []
	end
	# add item to the checkouts @item_list
	def scan(item)
		@item_list << item
	end

	# calculate overall total
	def total
		total = 0
		total_discount = 0
		# check if promotion_rules apply
		@promotion_rules.each do |pl|
			@item_list, discount = pl.check(@item_list)
			total_discount += discount
		end
		# get total
		total = @item_list.inject(0) {|total, item| total += item.price}
		# return total - deductions
		return (total - total_discount).round(2)
	end 
end
