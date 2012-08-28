class User
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  attr_accessor :id, :author, :avatar, :text, :category, :timestamp

  class << self
    def all
    	all = []
    	fixtures = YAML::load(File.open("spec/fixtures/users.yml"))
    	fixtures.each do |id, user|
    		all[id] = self.new(
    			:id => id, 
    			:author => user['author'],
    			:avatar => user['avatar'],
    			:text => user['text'],
    			:category => user['category'],
    			:timestamp => user['timestamp']
    			)
    	end
    	all
    end
  end



  def initialize(attributes = {})
    if attributes
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  end

  def persisted?
    false
  end 

end