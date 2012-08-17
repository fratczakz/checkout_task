# encoding: utf-8

# item class
class Item
	attr_accessor :price, :name, :code
	def initialize(code, name, price)
		@code = code
		@name = name
		@price = price
	end
end

