require 'spec_helper'

describe User do
  it "should be list of users" do
  	User.all.first.should be_a(User)
	end

	it "should be list of ordered users" do
  	User.latest.first.timestamp.should be >= User.latest.second.timestamp	
	end

	it "should be list of 'current' users" do
		User.find_by_category('current').each do |user|
			user.category.should == 'current'
		end
	end

	it "should be a user with id 1" do
		User.find_by_id(1).should be_a(User)
	end

	it "should be list of 2 'current' users" do
		User.find_by_category('current').paginate(1,2).count.should == 2
	end

end
