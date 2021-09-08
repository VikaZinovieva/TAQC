require 'faraday'
class ApiClient
  APP_JS = 'application/json'
  DEFAULT_USER = 'taqc_default'

  def initialize
    @base_url = 'https://petstore.swagger.io/v2/user/'
  end

  def get_user(username)
    app_request(:get, @base_url + "#{username}")
  end

  def generate_random_body
    {
        id: rand(1000),
        username: "user_#{SecureRandom.hex}",
        first_name: SecureRandom.hex,
        last_name: SecureRandom.hex,
        email: "#{SecureRandom.hex}@gmail.com",
        password: SecureRandom.hex,
        phone: SecureRandom.hex
    }
  end

  def adjust_body(opts)
    generate_random_body.merge(opts)
  end

  def create_user(opts)
    body = {
        "id": opts[:id],
        "username": opts[:username],
        "firstName": opts[:first_name],
        "lastName": opts[:last_name],
        "email": opts[:email],
        "password": opts[:password],
        "phone": opts[:phone],
        "userStatus": 0
    }
    app_request(:post, @base_url, body)
  end

  def user_login(username, password)
    app_request(:get, @base_url + 'login', { "username": username, "password": password })
  end

  def user_logout
    app_request(:get, @base_url + 'logout')
  end

  def update_user(username, body)
    app_request(:put, @base_url + "#{username}", body)
  end

  def delete_user(username)
    app_request(:delete, @base_url + "#{username}")
  end

  def login_as_default_user
    user_login(DEFAULT_USER, DEFAULT_USER)
  end

  private
  def app_request(type, url, body = nil)
    Faraday.send(type, url) do |req|
      req.headers['Content-Type'] = APP_JS
      req.body = body.to_json unless body.nil?
    end
  end
end
