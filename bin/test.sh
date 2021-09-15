#!/bin/bash -l

gem install bundler
bundle install
rspec spec/api/api_spec.rb