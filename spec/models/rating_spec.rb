require 'spec_helper'

describe Rating do

	it { should validate_presence_of(:restaurant_id) }
	it { should validate_presence_of(:user_id) }
	it { should validate_presence_of(:comment_id) }



	it { should belong_to(:restaurant) }
	it { should belong_to(:user) }
	it { should belong_to(:comment) }

end

