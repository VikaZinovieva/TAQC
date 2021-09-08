require 'faraday'
class ApiClient
  # refactoring needed
  # headers seem to always be same
  # response = Faraday.get('https://petstore.swagger.io/v2/user/login') do |req|
  #       req.headers['Content-Type'] = 'application/json'
  #       req.body = body.to_json
  #     end
  # seems to be good to refactor to one-liner

  APP_JS = "application/json"
  DEFAULT_PAGE = "https://petstore.swagger.io/v2/user/"

  def get_user(username)
    response = Faraday.get(DEFAULT_PAGE + "#{username}", {"accept" => APP_JS})
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
    response = Faraday.post(DEFAULT_PAGE) do |req|
      req.headers['Content-Type'] = APP_JS
      req.body = body.to_json
    end
  end

  def user_login(username, password)
    body = {
        "username": username,
        "password": password
    }
    response = Faraday.get(DEFAULT_PAGE + "login") do |req|
      req.headers['Content-Type'] = APP_JS
      req.body = body.to_json
    end
  end

  def user_logout
    response = Faraday.get(DEFAULT_PAGE + "logout", {"accept" => APP_JS})
  end

  def update_user(username, body)
    response = Faraday.put(DEFAULT_PAGE + "#{username}") do |req|
      req.headers['Content-Type'] = APP_JS
      req.body = body.to_json
    end
  end

  def delete_user(username)
    response = Faraday.delete(DEFAULT_PAGE + "#{username}") do |req|
      req.headers['Content-Type'] = APP_JS
      req.body = { "username": username }.to_json
   end
  end
end
