require 'spec_helper'

describe UsersHelper do
  describe "nice datetime" do
  	it "print nice datetime from timestamp" do
  		helper.nice_date(1346367539).should == "31. Aug 2012 00:58"
  	end
	end
end
