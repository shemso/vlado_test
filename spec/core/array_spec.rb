require 'spec_helper'

describe Array do

	it "should be 10 pages" do
  	[1,2,3,4,5,6,7,8,9,10].total_pages(1).should == 10
	end

	it "should be 5 pages" do
  	[1,2,3,4,5,6,7,8,9,10].total_pages(2).should == 5
	end

	it "should be 5 second items" do
  	[1,2,3,4,5,6,7,8,9,10].paginate(2,5).should == [6,7,8,9,10]
	end

	it "should be 2 pages and 5 second items" do
		[1,2,3,4,5,6,7,8,9,10].total_pages(5).should == 2
  	[1,2,3,4,5,6,7,8,9,10].paginate(2,5).should == [6,7,8,9,10]
	end

	it "should be nil" do
  	[1,2,3,4,5,6,7,8,9,10].paginate(2,50).should == nil
  	[1,2,3,4,5,6,7,8,9,10].paginate(50).should == nil
	end

end
