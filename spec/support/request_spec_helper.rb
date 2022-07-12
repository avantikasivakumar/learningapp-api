module RequestSpecHelper
  def json
    #puts response.body
    JSON.parse(response.body)
  end
  def auth_headers(user)
   # puts user.as_json
    
    post '/v1/user_management/login', params: { grant_type: "password", email: user.email, password: "Password" } 
  #  puts response.body
    return { auth: { 'Content-Type' => response.headers['Content-Type'], 'Authorization' => "Bearer #{JSON.parse(response.body)["token"]["access_token"]}" }, other: { 'refresh-token' => JSON.parse(response.body)["token"]["refresh_token"], 'access-token' => JSON.parse(response.body)["token"]["access_token"] }}
  end
end
