require_relative '../spec_helper'
require_relative 'api_client.rb'

RSpec.describe 'Create -> Login -> Get' do
  app_client = ApiClient.new
  invalid_body = {
    id: 'Artem',
    username: 'user_Lavrinenko$$',
    firstName: 'Olegovich',
    lastName: 'Lavash',
    email: 'artemiy%.com',
    password: '000',
    phone: 1234,
    userStatus: -1
  }

  before(:all) { app_client.login_as_default_user }


  context 'Verify that creation with invalid credentials is impossible' do
    it 'Creation with ALL invalid credentials is impossible' do
      response = app_client.create_user(invalid_body)
      expect(response.status).to eq(500)
    end

    invalid_id = {
      random_string: SecureRandom.base64,
      empty_string: ' ',
      symbols: '*_*',
      random_float: rand(1000.0),
      negative: rand(-100.0)
    }

    invalid_id.each_pair do |key, value|
      it "verifies #{key} ID passed" do
        pending 'missing validations for ID parameter' unless %i(random_string symbols).include?(key)
        body = app_client.adjust_body(id: value)
        response = app_client.create_user(body)
        expect(response.status).to eq(500)
      end
    end

    invalid_usernames = {
        empty: '    ',
        symbols: '$_$',
        short_size: SecureRandom.hex(1)
    }

    invalid_usernames.each_pair do |key, value|
      it "verifies #{key} username passed" do
        pending 'missing validations for username field'
        body = app_client.adjust_body(username: value)
        response = app_client.create_user(body)
        expect(response.status).to eq(500)
      end
    end

    invalid_firstnames = {
        empty: '    ',
        numbers: rand(1000),
        float: rand(1000.9),
        long: SecureRandom.hex(300),
        short_size: SecureRandom.hex(1)
    }

    invalid_firstnames.each_pair do |key, value|
      it "verifies #{key} fisrtName passed" do
        pending 'missing validations for firstName field'
        body = app_client.adjust_body(firstName: value)
        response = app_client.create_user(body)
        expect(response.status).to eq(500)
      end
    end

    invalid_lastnames = {
        number: SecureRandom.random_number(100),
        empty: ''
    }

    invalid_lastnames.each_pair do |key, value|
      it "verifies #{key} lastName passed" do
        pending 'missing validations for lastName parameter'
        body = app_client.adjust_body(lastName: value)
        response = app_client.create_user(body)
        expect(response.status).to eq(500)
      end
    end

    invalid_emails = {
        random_string: SecureRandom.hex,
        invalid_email: '@gmail.com',
        empty: ''
    }

    invalid_emails.each_pair do |key, value|
      it "verifies #{key} email passed" do
        pending 'missing validations for email parameter'
        body = app_client.adjust_body(email: value)
        response = app_client.create_user(body)
        expect(response.status).to eq(500)
      end
    end

    invalid_pass = {
        more_50_sym: rand(51..1000),
        less_8_sym: SecureRandom.hex(7)
    }

    invalid_pass.each_pair do |key, value|
      it "verifies #{key} password passed" do
        pending 'missing validations for password parameter'
        body = app_client.adjust_body(password: value)
        response = app_client.create_user(body)
        expect(response.status).to eq(500)
      end
    end

    it 'verifies creation with invalid Phone' do
      pending 'missing validation for phone parameter'
      invalid_phone = SecureRandom.hex
      body = app_client.adjust_body(phone: invalid_phone)
      response = app_client.create_user(body)
      expect(response.status).to eq(500)
    end

    it 'verifies creation with invalid UserStatus' do
      invalid_userStatus = SecureRandom.hex
      body = app_client.adjust_body(userStatus: invalid_userStatus)
      response = app_client.create_user(body)
      expect(response.status).to eq(500)
    end
  end
end
