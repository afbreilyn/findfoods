require 'spec_helper'

describe Tag do
  
	subject(:tag) do
		FactoryGirl.build(:tag,
			body: "sample body",
			author_id: 1,
			restaurant_id: 1)
	end

	it { should validate_presence_of(:body) }
	it { should validate_presence_of(:author_id) }
	it { should validate_presence_of(:restaurant_id) }

	it { should belong_to(:restaurant) }
	it { should belong_to(:author) }
	it { should have_many(:notifications) }


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
		before { tag.save }



		it "sends a notification to the restaurant owner" do 
			expect(tag.notifications.first.user.id).to eq(restaurant.owner_id)
		end
	end

end
