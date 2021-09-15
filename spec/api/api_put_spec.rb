require_relative '../spec_helper'
require_relative 'api_client.rb'
require 'securerandom'

RSpec.describe 'PUT method checking to the any data in the body' do
  api_cl = ApiClient.new
  body = api_cl.generate_random_body

  before(:all) do
    # why user is not created
		api_cl.create_user(body)
	end

  # Positive Functional Testing

  changing_opts = {
      id: rand(10000),
      username: SecureRandom.hex,
			firstName: SecureRandom.hex,
			lastName: SecureRandom.hex,
			email: SecureRandom.hex,
			password: SecureRandom.hex,
			phone: rand(100000).to_s
  }

  changing_opts.each_pair do |key, value|
		it 'verifies that user can edit his own ID' do
			body[key] = value
			api_cl.update_user(body[:username], body)
			api_cl.user_login(body[:username], body[:password])
			response = api_cl.get_user(body[:username])
			expect(response.status).to eq(200)
      response_body = JSON.parse(response.body).transform_keys(&:to_sym)
			expect(response_body[key]).to eq(value)
		end
  end

	# it 'verifies that user can edit his own ID' do
	# 	body[:id] = 144
	# 	api_cl.update_user(body[:id], body)
	# 	api_cl.user_login(body[:username], body[:password])
	# 	response = api_cl.get_user(body[:username])
	# 	expect(response.status).to eq(200)
	# end
	#
	# # it 'verifies that user can logged in by using new username' do
	# # 	body[:username] = 'KingOfTheNorth'
	# # 	api_cl.update_user(body[:username], body)
	# # 	api_cl.user_login(body[:username], body[:password])
	# # 	response = api_cl.get_user(body[:username])
	# # 	expect(response.status).to eq(200)
	# # end
	#
	# it 'verifies that first name can be edited' do
	# 	body[:firstName] = 'Robb'
	# 	api_cl.update_user(body[:firstName], body)
	# 	api_cl.user_login(body[:username], body[:password])
	# 	response = api_cl.get_user(body[:username])
	# 	expect(response.status).to eq(200)
	# end
	#
	# it 'verifies that last name can be edited' do
	# 	body[:lastName] = 'Stark'
	# 	api_cl.update_user(body[:lastName], body)
	# 	api_cl.user_login(body[:username], body[:password])
	# 	response = api_cl.get_user(body[:username])
	# 	expect(response.status).to eq(200)
	# end
	#
	# it 'verifies that email can be edited' do
	# 	body[:email] = 'robb-stark@gameofthrones.com'
	# 	api_cl.update_user(body[:email], body)
	# 	api_cl.user_login(body[:username], body[:password])
	# 	response = api_cl.get_user(body[:username])
	# 	expect(response.status).to eq(200)
	# end
	#
	# # it 'verifies that password can be edited' do
	# # 	body[:password] = '123456abc'
	# # 	api_cl.update_user(body[:password], body)
	# # 	api_cl.user_login(body[:username], body[:password])
	# # 	response = api_cl.get_user(body[:username])
	# # 	expect(response.status).to eq(200)
	# # end
	#
	# it 'verifies that phone number can be edited' do
	# 	body[:phone] = rand(100000).to_s
	# 	api_cl.update_user(body[:phone], body)
	# 	api_cl.user_login(body[:username], body[:password])
	# 	response = api_cl.get_user(body[:username])
	# 	expect(response.status).to eq(200)
	# end
end
