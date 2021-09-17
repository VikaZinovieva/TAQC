require_relative '../spec_helper'
require_relative 'api_client.rb'
require 'securerandom'

RSpec.describe 'Create -> Login -> Get' do

  app_cl = ApiClient.new
  body = app_cl.generate_random_body

  before(:all) { app_cl.login_as_default_user }

  context 'verify user info' do
    it 'verifies user can registered' do
      response = app_cl.create_user(body)
      expect(response.status).to eq(200)
    end

    it 'verifies user can login' do
      response = app_cl.user_login(body[:username], body[:password])
      expect(response.status).to eq(200)
    end

    it 'verifies user can get info' do
      response = app_cl.get_user(body[:username])
      expect(response.status).to eq(200)
    end

    it 'verifies user can logout' do
      response = app_cl.user_logout
      expect(response.status).to eq(200)
    end

  end

  context "Numerical value in 'username' field" do
    it "verifies user can registered with numerical value in 'username' field " do
      body = app_cl.adjust_body(username: 1)
      app_cl.create_user(body)
      app_cl.user_login(body[:username], body[:password])
      response = app_cl.get_user(body[:username])
      expect(response.status).to eq(200)
      app_cl.user_logout
    end
  end

  context "Letter value in 'username' field" do
    it "verifies user can registered with letter value in 'username' field " do
      body = app_cl.adjust_body(username: "userqwerty")
      app_cl.create_user(body)
      app_cl.user_login(body[:username], body[:password])
      response = app_cl.get_user(body[:username])
      expect(response.status).to eq(200)
      app_cl.user_logout
    end
  end

  context "Letter value in upper case in 'username' field" do
    it "verifies user can registered with letter value in upper case in 'username' field " do
      body = app_cl.adjust_body(username: "USERQWERTY")
      app_cl.create_user(body)
      app_cl.user_login(body[:username], body[:password])
      response = app_cl.get_user(body[:username])
      expect(response.status).to eq(200)
      app_cl.user_logout
    end
  end

  context "Mixed value in 'username' field" do
    it "verifies user can registered with mixed value in 'username' field " do
      body = app_cl.adjust_body(username: "userqwerty123")
      app_cl.create_user(body)
      app_cl.user_login(body[:username], body[:password])
      response = app_cl.get_user(body[:username])
      expect(response.status).to eq(200)
      app_cl.user_logout
    end
  end

  context "Numerical value in 'email' field" do
    it "verifies user can registered with numerical value in 'email' field " do
      body = app_cl.adjust_body(email: "1234@gmail.com")
      app_cl.create_user(body)
      app_cl.user_login(body[:username], body[:password])
      response = app_cl.get_user(body[:username])
      expect(response.status).to eq(200)
      app_cl.user_logout
    end
  end

  context "letter value in 'email' field" do
    it "verifies user can registered with numerical value in 'email' field " do
      body = app_cl.adjust_body(email: "qwerty@gmail.com")
      app_cl.create_user(body)
      app_cl.user_login(body[:username], body[:password])
      response = app_cl.get_user(body[:username])
      expect(response.status).to eq(200)
      app_cl.user_logout
    end
  end

  context "Numerical value in upper case in 'email' field" do
    it "verifies user can registered with numerical value in upper case in 'email' field " do
      body = app_cl.adjust_body(email: "QWERTY@gmail.com")
      app_cl.create_user(body)
      app_cl.user_login(body[:username], body[:password])
      response = app_cl.get_user(body[:username])
      expect(response.status).to eq(200)
      app_cl.user_logout
    end
  end

  context "Mixed value in 'email' field" do
    it "verifies user can registered with numerical value in 'email' field " do
      body = app_cl.adjust_body(email: "1234qwert@gmail.com")
      app_cl.create_user(body)
      app_cl.user_login(body[:username], body[:password])
      response = app_cl.get_user(body[:username])
      expect(response.status).to eq(200)
      app_cl.user_logout
    end
  end

  context 'Array of names(letters in upper and lower case + digits)' do

    massOfUsername = ["user", "user123", "USER", "USER123", "TTT"]
    massOfUsername.each{|username| it 'Verifies that users with differen names can register' do
      body = app_cl.adjust_body(username: username)
      app_cl.create_user(body)
      app_cl.user_login(body[:username], body[:password])
      response = app_cl.get_user(body[:username])
      expect(response.status).to eq(200)
      app_cl.user_logout
    end
    }
  end

  context 'Array of first name in upper and lower case + digits)' do

    massOfUsername = ["Nick", "nick", "NICK", "Nick", "N1ck"]
    massOfUsername.each{|username| it 'Verifies that users can register with name in upper/lower case + digits' do
      body = app_cl.adjust_body(firstName: username)
      app_cl.create_user(body)
      app_cl.user_login(body[:username], body[:password])
      response = app_cl.get_user(body[:username])
      expect(response.status).to eq(200)
      app_cl.user_logout
    end
    }
  end

end