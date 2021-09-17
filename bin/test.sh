#!/bin/bash
STRING="Hello"
echo $STRING
gem install bundler
bundle install
rspec spec/api/api_spec.rb