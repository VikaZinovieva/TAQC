#3) GET /user/username - valid and invalid checks  --> Bielenova Kateryna
#- parameter username passed to enpoint can be valid and invalid(existing, not-existing, too long...)

require_relative '../spec_helper'
require_relative 'api_client.rb'
require 'securerandom'

def generate_random_long_username
  SecureRandom.alphanumeric(257)
end

def generate_random_symbol_username
  symbols = ['!', '@', '$', '%', '#', '^', '&', '*', '(', ')', '_', '=', '+']
  username = ''
  rand(4..16).times { username << symbols[rand(0...symbols.size)] }
  return username
end

def generate_random_username
  SecureRandom.hex
end

RSpec.describe 'GET /user/username' do

  app_cl = ApiClient.new
  body = app_cl.generate_random_body
  
  before(:all) { app_cl.create_user(body) }
  after(:all) { app_cl.delete_user(body[:username]) }

  context 'verifies that user can be shown' do
    it 'valid checks -->  successful operation' do
      response = app_cl.get_user(body[:username])
      expect(response.status).to eq(200)
    end
  end

  hh_usernames = [ { "username" => generate_random_long_username }, { "username" => generate_random_symbol_username } ]
  hh_usernames.each do | hh |
    context 'verifies that user can not be shown' do
      it 'invalid checks --> invalid username supplied' do
        app_cl.adjust_body(hh)
        response = app_cl.get_user(body[:username])
        expect(response.status).to eq(400)
      end
    end
  end

  context 'verifies that user can not be shown' do
    it 'invalid checks --> user not found' do
        response = app_cl.get_user(generate_random_username)
        expect(response.status).to eq(404)
    end
  end
end
