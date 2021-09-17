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
    end

    dataID = {
        "negative values": -5,
        "empty field": " ",
        "specials symbols": "@/#$)",
        "length 51 letters": "k" * 51,
        "mixed values": "@#-5/Dark"
    }
    
    context 'verify user can update ID' do

        dataID.each_pair do |key, value| 
            it "verifies user can update with #{key}" do
                body[:id] = value
                response = app_cl.update_user(body[:username], body)
                expect(response.status).to eq(500)
            end            
        end
    end
  
    context 'verify user can update USER NAME' do

        it 'verifies user can not update username with empty field' do
            invalid_username = ''
            response = app_cl.update_user(body[:username], app_cl.adjust_body(username: invalid_username))
            expect(response.status).to eq(500)
        end

        it 'verifies user can not update username with negative values' do
            invalid_username = -1
            response = app_cl.update_user(body[:username], app_cl.adjust_body(username: invalid_username))
            expect(response.status).to eq(500)
        end

        it 'verifies user can not update username with specials symbols' do
            invalid_username = '@#-/'
            response = app_cl.update_user(body[:username], app_cl.adjust_body(username: invalid_username))
            expect(response.status).to eq(500)
        end

        it 'verifies user can not update username with mixed values' do
            invalid_username = '@#-/1Dark'
            #invalid_username = SecureRandom.base64(10)
            response = app_cl.update_user(body[:username], app_cl.adjust_body(username: invalid_username))
            expect(response.status).to eq(500)
        end

        it 'verifies user can not update username with length 51 symbols' do
            invalid_username = 'K' * 51
            response = app_cl.update_user(body[:username], app_cl.adjust_body(username: invalid_username))
            expect(response.status).to eq(500)
        end
    end

    data = {
        "1 symbol": 'F',
        "empty field": " ",
        "specials symbols": "@/#$)",
        "51 letters": 'k' * 51,
        "numerical values": 123456,
        "mixed values": '@#-/1Dark'
    }

    context 'verify user can update FIRST NAME' do
        
        data.each_pair do |key, value|
            it "verifies user can update with #{key}" do
                body[:firstName] = value
                response = app_cl.update_user(body[:username], body)
                expect(response.status).to eq(500)
            end
        end
    end



    context 'verify user can update LAST NAME' do

        data.each_pair do |key, value|
            it "verifies user can update with #{key}" do
                body[:lastName] = value
                response = app_cl.update_user(body[:username], body)
                expect(response.status).to eq(500)
            end
        end
    end


    context 'verify user can update EMAIL' do

        data.each_pair do |key, value|
            it "verifies user can update with #{key}" do
                body[:email] = value
                response = app_cl.update_user(body[:username], body)
                expect(response.status).to eq(500)
            end
        end
    end

    dataPassword = {
        "1 symbol": 'F',
        "empty field": " ",
        "specials symbols": "@/#$)",
        "51 letters": 'k' * 51,
        "mixed values": '@#-/1Dark'
    }

    context 'verify user can update PASSWORD' do

        dataPassword.each_pair do |key, value| 
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

    dataStatus = {
        "negative values": -5,
        "empty field": " ",
        "specials symbols": "@/#$)",
        "length 51 letters": "k" * 51,
        "text": "Fly",
        "mixed values": "@#-5/Dark"
    }

    context 'verify user can update USER STATUS' do

        dataStatus.each_pair do |key, value| 
            it "verifies user can update with #{key}" do
                body[:userStatus] = value
                response = app_cl.update_user(body[:username], body)
                expect(response.status).to eq(500)
            end
        end
    end
end
