require 'spec_helper'

describe User do

	subject(:user) do
		FactoryGirl.build(:user,
			fname: 'sennacy',
			lname: 'tambouer',
			email: 'st@email.com',
			city: 'outside of Amsterdam',
			state: 'NH',
			password: "good_password")
	end

	it { should validate_presence_of(:fname) }
	it { should validate_presence_of(:lname) }
	it { should validate_presence_of(:city) }
	it { should validate_presence_of(:state) }
	it { should validate_presence_of(:password_digest) }
	it { should ensure_length_of(:password).is_at_least(6) }

	it { should have_many(:restaurants) }
	it { should have_many(:tags) }
	it { should have_many(:comments) }
	it { should have_many(:notifications) }


	it "creates a password_digest when a password is given" do
		expect(user.password_digest).to_not be_nil
	end
	
	it "creates a session token before validation" do
		user.valid?
		expect(user.session_token).to_not be_nil
	end

	describe "#reset_session_token!" do
		it "sets a new sessiontoken on the user" do 
			user.valid?
			old_session_token = user.session_token
			user.reset_session_token!
			expect(user.session_token).to_not eq(old_session_token)
		end

		it "returns the new session token" do 
			expect(user.reset_session_token!).to eq(user.session_token)
		end
	end

	describe "#is_password?" do
		it "verifies a password is correct" do
			expect(user.is_password?('good_password')).to be_true
		end

		it "verifies a password is correct" do
			expect(user.is_password?('not_the_password')).to be_false
		end
	end

	describe "#find_by_credentials" do
		before { user.save }

		it "returns user with good credentials" do
			expect(User.find_by_credentials('st@email.com', 'good_password')).to eq(user)
		end

		it "returns nil when given bad credentials" do
			expect(User.find_by_credentials('st@email.com', 'bad_password')).to eq(nil)
		end
	end
end
