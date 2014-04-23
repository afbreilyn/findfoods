require 'spec_helper'

describe Comment do

	subject(:comment) do
		FactoryGirl.build(:comment,
			body: "man - what great foods!",
			user_id: 1,
			restaurant_id: 2,
			id: 13
	end

	it { should validate_presence_of(:body) }
	it { should validate_presence_of(:user_id) }

	it { should belong_to(:user) }
	it { should belong_to(:parent_comment) }
	it { should belong_to(:restaurant) }



end