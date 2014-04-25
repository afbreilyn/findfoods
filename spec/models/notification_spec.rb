require 'spec_helper'

describe Notification do
  
	subject(:notification) do
		FactoryGirl.build(:notification,
			notifiable_id: 1,
			notifiable_type: "Comment",
			user_id: 1,
			event_id: 1,
			is_read: false)
	end

	it { should validate_presence_of(:notifiable_id) }
	it { should validate_presence_of(:notifiable_type) }
	it { should validate_presence_of(:event_id) }
	
	it { should validate_presence_of(:event_id) }
	it { should validate_presence_of(:user_id) }
	it { should validate_presence_of(:is_read) }

	it { should belong_to(:notifiable) }
	it { should belong_to(:user) }

end
