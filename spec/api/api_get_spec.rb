#3) GET /user/username - valid and invalid checks  --> Bielenova Kateryna
#- parameter username passed to enpoint can be valid and invalid(existing, not-existing, too long...)

require_relative '../spec_helper'
require_relative 'api_client.rb'

RSpec.describe 'GET /user/username' do
  app_cl = ApiClient.new
  body = app_cl.generate_random_body

  def retry_request(response, &block)
    max_retries = 5
    while max_retries > 0
      block_response = block.call
      max_retries -= 1
      return true if block_response.status == response
    end
  end

  before(:all) do
    app_cl.login_as_default_user
    retry_request(200) { app_cl.create_user(body) }
    retry_request(200) { app_cl.user_login(body[:username], body[:password]) }
    retry_request(200) { get_response = app_cl.get_user(body[:username]) }
    app_cl.user_logout
  end

  after(:all) { app_cl.delete_user(body[:username]) }

  context 'verifies that user can be shown' do
    it 'create - get -->  successful operation' do
      request_success = retry_request(200) { app_cl.get_user(body[:username]) }
      expect(request_success).to be_truthy
    end

    it 'create - login - get -->  successful operation' do
      app_cl.user_login(body[:username], body[:password])
      request_success = retry_request(200) { app_cl.get_user(body[:username]) }
      expect(request_success).to be_truthy
      app_cl.user_logout
    end

    it 'create - login - logout  -get -->  successful operation' do
      app_cl.user_login(body[:username], body[:password])
      app_cl.user_logout
      request_success = retry_request(200) { app_cl.get_user(body[:username]) }
      expect(request_success).to be_truthy
    end
  end

  hh_usernames = {
    long: "uuudsfsd_#{SecureRandom.alphanumeric(3000)}",
    symbol: '!',
    empty: ''
  }

  context 'when retrieving username' do
    hh_usernames.each_pair do | key, value |
      it "verifies #{key} username" do
        pending 'validations on update dont work' unless key == :long
        body = app_cl.adjust_body(username: value)
        app_cl.update_user(value, body)
        request_success = retry_request(404) { app_cl.get_user(value) }
        expect(request_success).to be_truthy
      end
    end

    it 'non-existent user --> user not found' do
      request_success = retry_request(404) { app_cl.get_user("my_user_#{SecureRandom.hex}") }
      expect(request_success).to be_truthy
    end

    it 'user after deletion --> user not found' do
      body = app_cl.generate_random_body
      retry_request(200) { app_cl.create_user(body) }
      retry_request(200) { app_cl.delete_user(body[:username]) }
      request_success = retry_request(404) { app_cl.get_user(body[:username]) }
      expect(request_success).to be_truthy
    end
  end
end
