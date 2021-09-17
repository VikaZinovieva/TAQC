require_relative '../spec_helper'
require_relative 'api_client.rb'

RSpec.describe 'PUT endpoint' do
  app_cl = ApiClient.new
  body = app_cl.generate_random_body

  before(:all) { app_cl.login_as_default_user }

  dataID = {
    negative_values: -5,
    empty_field: ' ',
    specials_symbols: '@/#$)',
    length_51_letters: 'k' * 51,
    mixed_values: '@#-5/Dark'
  }

  context 'when invalid ID' do
    dataID.each_pair do |key, value|
      it "verifies can update with #{key}" do
        pending 'existing bug with validation on ID' if %i(negative_values empty_field).include?(key)
        body[:id] = value
        response = app_cl.update_user(body[:username], body)
        expect(response.status).to eq(500)
      end
    end
  end

  context 'verify can update USER NAME' do
    invalid_usernames = {
      empty: '',
      negative: -1,
      symbols: '@#-/',
      mixed: '@#-/1Dark',
      long: 'K' * 51
    }

    invalid_usernames.each_pair do |key, value|
      it "verifies can not update with #{key} value" do
        pending 'existing bug for updating with invalid username'
        response = app_cl.update_user(body[:username], app_cl.adjust_body(username: value))
        expect(response.status).to eq(500)
      end
    end
  end

  invalid_names = {
    hash_1_symbol: 'F',
    empty_field: " ",
    specials_symbols: "@/#$)",
    has_51_letters: 'k' * 51,
    numerical_values: 123456,
    mixed_values: '@#-/1Dark'
  }

  context 'verify user can update FIRST NAME' do
    invalid_names.each_pair do |key, value|
      it "verifies user can update with #{key}" do
        body[:firstName] = value
        response = app_cl.update_user(body[:username], body)
        expect(response.status).to eq(500)
      end
    end
  end

  context 'verify user can update LAST NAME' do
    invalid_names.each_pair do |key, value|
      it "verifies user can update with #{key}" do
        body[:lastName] = value
        response = app_cl.update_user(body[:username], body)
        expect(response.status).to eq(500)
      end
    end
  end

  context 'verify user can update EMAIL' do
    invalid_names.each_pair do |key, value|
      it "verifies user can update with #{key}" do
        body[:email] = value
        response = app_cl.update_user(body[:username], body)
        expect(response.status).to eq(500)
      end
    end
  end

  invalid_passwords = {
    has_1_symbol: 'F',
    empty_field: ' ',
    specials_symbols: '@/#$)',
    has_51_letters: 'k' * 51,
    mixed_values: '@#-/1Dark'
  }

  context 'verify user can update PASSWORD' do
    invalid_passwords.each_pair do |key, value|
      it "verifies user can update with #{key}" do
        body[:password] = value
        response = app_cl.update_user(body[:username], body)
        expect(response.status).to eq(500)
      end
    end
  end

  context 'verify user can update PHONE' do
    dataID.each_pair do |key, value|
      it "verifies user can update with #{key}" do
        body[:phone] = value
        response = app_cl.update_user(body[:username], body)
        expect(response.status).to eq(500)
      end
    end
  end

  invalid_status = {
    negative_values: -5,
    empty_field: ' ',
    specials_symbols: '@/#$)',
    length_51_letters: 'k' * 51,
    text: 'Fly',
    mixed_values: '@#-5/Dark'
  }

  context 'verify user can update USER STATUS' do
    invalid_status.each_pair do |key, value|
      it "verifies user can update with #{key}" do
        body[:userStatus] = value
        response = app_cl.update_user(body[:username], body)
        expect(response.status).to eq(500)
      end
    end
  end
end
