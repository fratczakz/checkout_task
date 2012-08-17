# promotion_rule.rb

# template class for promotianl rules
class PromotionRule
	def initialize()
	end

	def check(item_list)
		puts 'This is not implemented yet.'
		return item_list, 0
	end
end

# promotion class for 'more than x than update price'
class LowerPriceWhenMoreThanX < PromotionRule
	def initialize(item, count, n_price)
		@item = item
		@count = count
		@n_price = n_price
	end
	def check(item_list)
		# get items with with @item.code
		items = item_list.find_all {|item| item.code == @item.code}
		# check if there are more than @count
		if items.length >= @count 
			# update price of promotional items
			res_list = item_list.collect do |item|
				if item.code == @item.code
					item.price = @n_price
				end
				item
			end
			return res_list, 0
		end
		return item_list, 0		
	end
end

# promotion class for 'total more than x then y percent discount'
class DiscountIfOverThreshold < PromotionRule
	def initialize(threshold, discount)
		@threshold = threshold
		@discount = discount
	end

	def check(item_list)
		discount = 0
		# calculate the total
		total = item_list.inject(0) do |sum, item|
			sum += item.price
		end
		# check if above @threshold
		if total > @threshold
			# calculate deduction from total
			discount = total*@discount
		end
		return item_list, discount
	end
end