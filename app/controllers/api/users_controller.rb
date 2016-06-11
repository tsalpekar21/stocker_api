module Api
  class UsersController < ApplicationController
    def create
      presenter = user_service.create(user_params)
      if presenter.successful?
        render json: { user: presenter.jsonify, status: 200 }
      else
        render json: { errors: presenter.errors, status: 500 }
      end
    end

    def update
      success = user_service.update(params[:id], user_params)
      if success
        render json: { status: 200 }
      else
        render json: { status: 500 }
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
