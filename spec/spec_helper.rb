require 'rspec'
require_relative '../tools/driver.rb'
require 'pry'
require_relative '../env/common_variables'
Dir[File.join(Dir.pwd, 'pages/**/*.rb')].each { |f| require f }
