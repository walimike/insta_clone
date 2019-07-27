module API
  class SessionsController < ApplicationController
    protect_from_forgery with: :null_session
    def new
    end

    def create
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to api_users_path
      else
        redirect_non_user
      end
    end

    private
    def redirect_non_user
      render json: {
        errors: "You are not authorized to view this resource", status: 401
      }
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_url, notice: "Logged out!"
    end
  end
end