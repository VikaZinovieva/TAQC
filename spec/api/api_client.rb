require 'faraday'
class ApiClient
  APP_JS = "application/json"

  def initialize
    @base_url = 'https://petstore.swagger.io/v2/user/'
  end

  def get_user(username)
    app_request(:get, @base_url + "#{username}")
  end

  def generate_random_body
    {
        # added limits to generated string
        # there is limit somewhere, which doesnt allow to get user
        # we have to find it out :)
        id: 1000 + rand(1000),
        username: "user_#{SecureRandom.hex(10)}",
        first_name: SecureRandom.hex(10),
        last_name: SecureRandom.hex(10),
        email: "#{SecureRandom.hex(10)}@gmail.com",
        password: SecureRandom.hex(10),
        phone: SecureRandom.hex(10)
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

  private
  def app_request(type, url, body = nil)
    Faraday.send(type, url) do |req|
      req.headers['Content-Type'] = APP_JS
      req.body = body.to_json unless body.nil?
    end
  end
end
