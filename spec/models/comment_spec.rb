require 'spec_helper'

describe Comment do

	# subject(:comment) do
	# 	FactoryGirl.build(:comment,
	# 		body: "man - what great foods!",
	# 		user_id: 1,
	# 		commentable_id: 2,
	# 		commentable_type: "Restaurant",
	# 		id: 13)
	# end

	it { should validate_presence_of(:body) }
	it { should validate_presence_of(:user_id) }

	it { should belong_to(:commentable) }
	it { should belong_to(:parent_comment) }
	it { should have_many(:child_comments) }
	it { should have_many(:notifications) }

end