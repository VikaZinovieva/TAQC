require_relative '../spec_helper'
require_relative 'api_client.rb'
require 'securerandom'

RSpec.describe 'Login ->logout -> Get' do

  app_cl = ApiClient.new
  body = app_cl.generate_random_body

  before(:all) { app_cl.create_user(body)}

  context 'Positive login-logout tests' do
    it 'with valid credentials' do
      app_cl.user_login(body[:username], body[:password])
      response = app_cl.user_logout
      expect(response.status).to eq(200)
    end

    it 'login-logout two times' do
      app_cl.user_login(body[:username], body[:password])
      app_cl.user_logout
      app_cl.user_login(body[:username], body[:password])
      response = app_cl.user_logout
      expect(response.status).to eq(200)
    end

  end

  context 'Negative login-logout tests' do
	# Errors in the test
    xit 'two times in row' do
      app_cl.user_login(body[:username], body[:password])
	  app_cl.user_logout
      response = app_cl.user_logout
      expect(response.status).to eq(403)
    end
  end

  end