require_relative '../spec_helper'
require_relative 'api_client.rb'
require 'securerandom'

RSpec.describe 'GET /user/login' do

  app_cl = ApiClient.new
  body = app_cl.generate_random_body

  before(:all) { app_cl.create_user(body)}

  context 'Positive login tests' do
    it 'user can login' do
      response = app_cl.user_login(body[:username], body[:password])
      expect(response.status).to eq(200)
    end

    it 'user can logout' do
      response = app_cl.user_logout
      expect(response.status).to eq(200)
    end

    it 'already logged user can logout' do
      app_cl.user_login(body[:username], body[:password])
      response = app_cl.user_logout
      expect(response.status).to eq(200)
    end

    it 'login-logout-login' do
      app_cl.user_login(body[:username], body[:password])
      app_cl.user_logout
      response = app_cl.user_login(body[:username], body[:password])
      expect(response.status).to eq(200)
    end
  end

  context 'Negative login tests' do
    it 'user can`t log in while previous user isn`t logged out' do
      app_cl.user_login(body[:username], body[:password])
      app_cl.user_login(body[:username], body[:password])
      app_cl.user_logout
      response = app_cl.user_login(body[:username], body[:password])
      expect(response.status).to eq(200)
    end

    it 'unlogged user can`t get data' do
      app_cl.user_login(body[:username], body[:password])
      app_cl.user_logout
      response = app_cl.get_user(body[:username])
      expect(response.status).to eq(404)
    end

    it 'same user tries to log in two times in row' do
      app_cl.user_login(body[:username], body[:password])
      app_cl.user_login(body[:username], body[:password])
      response = app_cl.get_user(body[:username])
      expect(response.status).to eq(401)
    end
  end
end
