ENV["RAILS_ENV"] = 'test'
Dir[File.join(File.expand_path(File.dirname(__FILE__)), '../calc/**/*.rb')].each { |file| require file }

RSpec.configure do |config|
  # Use color in STDOUT
  config.color = true
end
