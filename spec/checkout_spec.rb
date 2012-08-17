# checkout_spec.rb
require 'spec_helper'

describe Checkout do
	before :each do
		@items_available = {
			"001" => Item.new(001, 'Lavender heart', 9.25),
			"002" => Item.new(002, 'Personalised cufflinks', 45.00),
			"003" => Item.new(003, 'Kids T-shirt', 19.95)
		}
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

		@co = Checkout.new(promotion_rules)
	end

	describe '#new' do
		it 'takes promotion rules and returns Checkout object' do
			@co.should be_an_instance_of Checkout
		end
	end

	describe '#scan' do
		it 'adds an item to the checkout list.' do
			@co.scan(@items_available['001'])
			@co.scan(@items_available['002'])
			@co.item_list.length.should == 2
		end
	end

	it 'calculatec the total' do
		@co.scan(@items_available['001'])
		@co.scan(@items_available['002'])
		@co.scan(@items_available['003'])
		@co.scan(@items_available['001'])
		@co.total.should == 73.76
	end
	it 'calculatec the total' do
		@co.scan(@items_available['001'])
		@co.scan(@items_available['002'])
		@co.scan(@items_available['003'])
		@co.total.should == 66.78
	end
	it 'calculatec the total' do
		@co.scan(@items_available['001'])
		@co.scan(@items_available['001'])
		@co.scan(@items_available['003'])
		@co.total.should == 36.95
	end

end