module Api
  class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods

    before_action :verify_authentication_token

    private

    def verify_authentication_token
      authenticate_with_http_token do |token, options|
        token =  Token.find_by(access_token: token)
        head :unauthorized unless token
        @current_user = token.user
      end
    end

  end
end
