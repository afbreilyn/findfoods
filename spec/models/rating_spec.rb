require 'spec_helper'

describe Rating do

	it { should validate_presence_of(:restaurant_id) }
	it { should validate_presence_of(:user_id) }
	it { should validate_presence_of(:comment_id) }
	it { should validate_presence_of(:rating) }

	it { should validate_numericality_of(:rating).is_less_than_or_equal_to(7) }
	it { should validate_numericality_of(:rating).is_greater_than_or_equal_to(0) }


	it { should belong_to(:restaurant) }
	it { should belong_to(:user) }
	it { should belong_to(:comment) }

end

