module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end
  def auth_headers(user)
    post '/v1/user_management/session', params: { user: { grant_type: "password", email: user.email, password: "Password" } }
    return { auth: { 'Content-Type' => response.headers['Content-Type'], 'Authorization' => "Bearer #{JSON.parse(response.body)["token"]["access_token"]}" }, other: { 'refresh-token' => JSON.parse(response.body)["token"]["refresh_token"], 'access-token' => JSON.parse(response.body)["token"]["access_token"] }}
  end
end
