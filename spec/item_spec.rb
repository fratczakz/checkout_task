# item_spec.rb
require 'spec_helper'

describe Item do
	before :all do
		@item = Item.new(001, 'Lavender heart', 9.25)
	end

	describe '#new' do
		it 'creates new instance of the Item' do
			@item.should be_an_instance_of Item
		end
	end

	describe '#code' do
		it 'returns the correct code' do
			@item.code.should eql 001
		end
	end
	describe '#name' do
		it 'returns the correct name' do
			@item.name.should eql 'Lavender heart'
		end
	end
	describe '#price' do
		it 'returns the correct price' do
			@item.price.should eql 9.25
		end
	end
end
