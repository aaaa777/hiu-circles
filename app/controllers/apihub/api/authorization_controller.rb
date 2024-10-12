class Apihub::Api::AuthorizationController < Apihub::Api::ApiController
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  http_basic_authenticate_with name: "admin", password: "password"

  
end