require 'rspec'
#require_relative '../tools/driver.rb'
require 'pry'
require_relative '../env/common_variables'
require_relative '../pages/base_page'
require_relative '../tools/caching_classes'
Dir[File.join(Dir.pwd, 'pages/**/*.rb')].each { |f| require f }

