require 'spec_helper'

describe UsersController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "returns http success and 10 json items" do
      get 'index', :format => :json
      response.should be_success
      body = JSON.parse(response.body)
      body.should have(10).items
    end

    it "returns http success for 3rd pagination page" do
      get 'index', :page => 3
      response.should be_success
      response.should render_template("users/index")
    end

  end

  describe "GET 'category'" do 
    it "returns http success and show category" do
      get 'category', :format => :json, :category => 'new'
      response.should be_success
      body = JSON.parse(response.body)
      body.count.should >= 1
    end

    it "returns http success and show category" do
      get 'category', :format => :json, :category => 'new'
      response.should be_success
      body = JSON.parse(response.body)
      body.count.should >= 1
    end

    it "returns http success and show category" do
      get 'category', :format => :json, :category => 'non existing'
      response.should be_success
      body = JSON.parse(response.body)
      body.count.should == 0
    end

  end

  describe "GET 'show'" do
    it "returns http success and renders correct template" do
      get 'show', :id => '1'
      response.should be_success
      response.should render_template("users/show")
    end

    it "returns http success and renders correct template" do
      get 'show', :format => :json, :id => '1'
      response.should be_success
      body = JSON.parse(response.body)
      body['author'].should == 'Vladimir Grubor'
    end

    it "redirect for wrong users" do
      get 'show', :id => '10000'
      response.should be_redirect
    end

  end

  describe "GET 'total'" do
    it "returns total number of users in JSON" do
      get "total", :format => :json
      response.should be_success
      response.body.should == '50'
    end
  end


end
