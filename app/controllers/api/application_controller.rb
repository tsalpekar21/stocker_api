module Api
  class ApplicationController < ActionController::API
    before_filter :authenticate!

    private

    def current_user
    end


    def authenticate!
    end

  end
end
