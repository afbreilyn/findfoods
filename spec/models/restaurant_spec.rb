require 'spec_helper'

describe Restaurant do

	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:street1) }
	it { should validate_presence_of(:city) }
	it { should validate_presence_of(:state) }
	it { should ensure_length_of(:state).is_at_most(2) }
	it { should validate_presence_of(:zip) }

	it { should belong_to(:owner) }
	it { should have_many(:comments) }
	it { should have_many(:tags) }
	it { should have_many(:notifications) }
	it { should have_many(:ratings) }

end
