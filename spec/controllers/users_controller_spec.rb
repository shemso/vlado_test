require 'spec_helper'

describe UsersController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'index' format: json" do
    it "returns http success" do
      get 'index', :format => :json
      response.should be_success
      body = JSON.parse(response.body)
      body.should have(11).items
    end
  end



end
