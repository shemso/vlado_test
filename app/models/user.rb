class User
  
  attr_accessor :id, :author, :avatar, :text, :category, :timestamp


  class << self
    def all
      fdata =File.open("spec/fixtures/users.yml").read
      usr = YAML::load(ERB.new(fdata).result(binding)).symbolize_keys
      usr[:users].map{ |r| User.new(r) }
    end

    def latest
    	self.all.sort_by {|t| t.timestamp}.reverse
    end
    
    def categories
      ['New employees','current','disabled','new','old']
    end

    def find_by_id(id)
      self.all.find {|t| t.id == id.to_i}
    end

    def find_by_category(category)
      self.latest.find_all {|t| t.category == category}
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