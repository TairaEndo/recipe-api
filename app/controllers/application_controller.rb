class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session

    def route_not_found
        render json: { message: "No Route matches" }, status: :not_found
      end
end
