module Api
  class SessionsController < ApplicationController
    skip_before_filter :login

    def login
      presenter = user_service.authenticate(user_params[:email], user_params[:password])
      if user_service.successful?
        render json: presenter.token_and_user, status: 200
      else
        render json: { errors: user_service.errors }, status: 422
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end

    def user_service
      @service ||= UserService.new
    end

  end
end
