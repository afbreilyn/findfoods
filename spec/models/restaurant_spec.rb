require 'spec_helper'

describe Restaurant do

	subject(:restaurant) do
		FactoryGirl.build(:restaurant,
			name: "tommy's pizza house",
			street1: '36 Cooper Sq',
			city: 'NYC',
			state: 'NY',
			zip: 01010)
	end

	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:street1) }
	it { should validate_presence_of(:city) }
	it { should validate_presence_of(:state) }
	it { should validate_presence_of(:zip) }

	it { should belong_to(:owner) }



end
