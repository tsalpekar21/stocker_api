module Api
  class UsersController < ApplicationController
    def create
      presenter = user_service.create(user_params)
      if presenter.successful?
        render json: { user: presenter.jsonify, status_code: 200 }
      else
        render json: { user: presenter.errors, status_code: 500 }
      end
    end

    def update
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
