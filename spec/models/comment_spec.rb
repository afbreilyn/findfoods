require 'spec_helper'

describe Comment do

	it { should validate_presence_of(:body) }
	it { should validate_presence_of(:user_id) }

	it { should belong_to(:commentable) }
	it { should belong_to(:parent_comment) }

	it { should have_many(:child_comments) }
	it { should have_many(:notifications) }

	it { should have_one(:rating) }

	subject(:comment) do
		FactoryGirl.build(:comment,
			body: "man - what great foods!",
			user_id: 1,
			commentable_id: 1,
			commentable_type: "Restaurant",
			id: 13)
	end

	restaurant = FactoryGirl.build(:restaurant,
			name: "tommy's pizza house",
			street1: '36 Cooper Sq',
			city: 'NYC',
			state: 'NY',
			zip: 01010,
			id: 1,
			owner_id: 1)

	user = FactoryGirl.build(:user,
			fname: 'sennacy',
			lname: 'tambouer',
			email: 'st@email.com',
			city: 'outside of Amsterdam',
			state: 'NH',
			password: "good_password",
			id: 1)

	describe "#notify_owner!" do
		before { user.save }
		before { restaurant.save }
		before { comment.save }

		it "sends a notification to the restaurant owner" do 
			expect(comment.notifications.first.user.id).to eq(restaurant.owner_id)
		end
	end
end