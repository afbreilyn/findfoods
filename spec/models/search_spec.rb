require 'spec_helper'

describe Search do
  
	it { should validate_presence_of(:search_params) }
	it { should validate_presence_of(:start_location) }

	it { should belong_to(:user) }


end
