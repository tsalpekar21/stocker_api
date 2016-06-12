module Api
  class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_filter :verify_authentication_token

    private

    def verify_authentication_token
      authenticate_or_request_with_http_token do |token, options|
        found_token =  Token.find_by(access_token: token)
        head :unauthorized and return false unless found_token
        redirect_to api_login_path if found_token.expired?
        @current_user = found_token.user
      end
    end

  end
end
