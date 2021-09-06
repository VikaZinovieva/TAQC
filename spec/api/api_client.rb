class ApiClient
  # refactoring needed
  # headers seem to always be same
  # response = Faraday.get('https://petstore.swagger.io/v2/user/login') do |req|
  #       req.headers['Content-Type'] = 'application/json'
  #       req.body = body.to_json
  #     end
  # seems to be good to refactor to one-liner

  def get_user(username)
    response = Faraday.get("https://petstore.swagger.io/v2/user/#{username}", {"accept" => "application/json"})
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
    response = Faraday.post('https://petstore.swagger.io/v2/user') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = body.to_json
    end
  end

  def user_login(username, password)
    body = {
        "username": username,
        "password": password
    }
    response = Faraday.get('https://petstore.swagger.io/v2/user/login') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = body.to_json
    end
  end

  def user_logout
    response = Faraday.get("https://petstore.swagger.io/v2/user/logout", {"accept" => "application/json"})
  end

  def update_user(username, body)
    response = Faraday.put("https://petstore.swagger.io/v2/user/#{username}") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = body.to_json
    end
  end

  def delete_user(username)
    response = Faraday.delete("https://petstore.swagger.io/v2/user/#{username}") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = { "username": username }.to_json
   end
  end
end
