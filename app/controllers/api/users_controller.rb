module Api
  class UsersController < ApplicationController
    skip_before_filter :verify_authentication_token, :only => [:create]

    def create
      presenter = user_service.create(user_params)
      if user_service.successful?
        render json: presenter.token_and_user, status: 200
      else
        render json: { errors: user_service.errors }, status: 500
      end
    end

    def update
      success = user_service.update(params[:id], user_params)
      if success
        head :ok
      else
        head 500
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
    end

    def user_service
      @service ||= UserService.new
    end
  end
end
