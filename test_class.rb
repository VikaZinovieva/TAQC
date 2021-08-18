module Loggable
  def log
    puts 'logging'
  end
end

class Browser
  puts self

  def self.test
    puts self
    puts 'class'
  end

  def test
    puts self
    puts 'dadsfsa'
  end
end

class Parser
  include Loggable

  def test
    puts 'gfdsg'
  end
end

