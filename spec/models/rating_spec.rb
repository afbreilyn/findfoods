require 'spec_helper'

describe Rating do

	it { should belong_to(:restaurant) }
	it { should belong_to(:user) }

end

