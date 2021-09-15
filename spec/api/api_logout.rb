=begin
8) GET
/user/logout - valid-invalid checks   --> Politikova Anna

- user logs out;
- same user tries to log out two times in row
- login - logout - login - logout
=end

require 'faraday'
class ApiClient
  APP_JS = 'application/json'
  DEFAULT_USER = 'taqc_default'

  def initialize
    @base_url = 'https://petstore.swagger.io/v2/user/logout'
  end

  def create_user(body)
    app_request(:post, @base_url, body)
  end

  def user_login(username, password)
    app_request(:get, @base_url + 'login', { "username": username, "password": password })
  end

  def user_logout
    app_request(:get, @base_url + 'logout')
  end