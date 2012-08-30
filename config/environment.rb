# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
VladoTest::Application.initialize!
Dir[File.join(Rails.root, "lib", "core_ext", "*.rb")].each {|l| require l }