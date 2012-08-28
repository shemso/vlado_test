class User
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :id, :author, :avatar, :text, :category, :timestamp
  

  class << self
    def all
    	all = Hash.new
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

    def page
    	Kaminari.paginate_array(self.all).page(1).per(10)
    end

    def latest
    	self.all.sort_by {|a,i| i.timestamp}
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