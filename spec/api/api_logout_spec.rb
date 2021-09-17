require_relative '../spec_helper'
require_relative 'api_client.rb'
require 'securerandom'

RSpec.describe 'Login ->logout -> Get' do
  app_cl = ApiClient.new
  body = app_cl.generate_random_body

  before(:all) { app_cl.create_user(body)}

  context 'when positive login-logout tests' do
    it 'user can login' do
      response = app_cl.user_login(body[:username], body[:password])
      expect(response.status).to eq(200)
    end

    it 'user can logout' do
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

    it 'user can not get data in the unregistered status' do
      app_cl.user_login(body[:username], body[:password])
      app_cl.user_logout
      response = app_cl.get_user(body[:username])
      expect(response.status).to eq(404)
    end

    it 'user can not get data in the unregistered status' do
      pending 'receiving 200'
      app_cl.user_login(body[:username], body[:password])
      app_cl.user_logout
      response = app_cl.get_user(body[:username])
      expect(response.status).to eq(404)
    end
  end

  context 'Negative login-logout tests' do
    it 'two times in row' do
      pending 'receiving 200'
      app_cl.user_login(body[:username], body[:password])
      app_cl.user_logout
      response = app_cl.user_logout
      expect(response.status).to eq(401)
    end

    it 'user can not get data after double logout' do
      pending 'receiving 200'
      app_cl.user_login(body[:username], body[:password])
      app_cl.user_logout
      app_cl.user_logout
      response = app_cl.get_user(body[:username])
      expect(response.status).to eq(401)
    end
  end
end
