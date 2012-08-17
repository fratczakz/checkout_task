# promotion_rules_spec.rb
require 'spec_helper'

describe PromotionRule do
	before :all do
		@promotion_rule = PromotionRule.new()
		@item_list = [
			Item.new(001, 'Lavender heart', 9.25)
		]
	end

	describe '#new' do
		it 'creates new PromotionRule object' do
			@promotion_rule.should be_an_instance_of PromotionRule
		end
	end

	it 'checks if the rule apply and returns modified item_list, and deduction of total' do
		@promotion_rule.check(@item_list).should == [@item_list, 0]
	end
end

describe LowerPriceWhenMoreThanX do
	before :each do
		@promotion_rule = LowerPriceWhenMoreThanX.new(Item.new(001, 'Lavender heart', 9.25), 2, 8.50)
		@item_list = [
			Item.new(001, 'Lavender heart', 9.25),
			Item.new(001, 'Lavender heart', 9.25)
		]
	end

	describe '#new' do
		it 'creates new LowerPriceWhenMoreThanX object' do
			@promotion_rule.should be_an_instance_of LowerPriceWhenMoreThanX
		end
	end

	it 'checks if the rule apply and returns modified item_list, and deduction of total' do
		@promotion_rule.check(@item_list).should == [@item_list, 0]
		updated_items = @item_list.select { |item| item.code == 001 }
		updated_items.length.should == 2
		updated_items.each do |item|
			item.price.should == 8.5
		end
	end
end

describe DiscountIfOverThreshold do
	before :each do
		@promotion_rule = DiscountIfOverThreshold.new(60, 0.1)
		@item_list = [
			Item.new(002, 'Personalised cufflinks', 45.00),
			Item.new(002, 'Personalised cufflinks', 45.00)
		]
	end

	describe '#new' do
		it 'creates new DiscountIfOverThreshold object' do
			@promotion_rule.should be_an_instance_of DiscountIfOverThreshold
		end
	end

	it 'checks if the rule apply and returns modified item_list, and deduction of total' do
		@promotion_rule.check(@item_list).should == [@item_list, 9]
	end
end