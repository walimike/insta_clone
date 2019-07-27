module API
    class UsersController < ApplicationController
      protect_from_forgery with: :null_session
      def index
        @users = User.all
  
        render json: { posts: @users }
      end

      def show
        render json: {user: User.find(params[:id])}
      end

      def new
        @user = User.new
      end

      def create
        new_user = User.create(user_params)
        if new_user.valid?
          render json: { users: User.all }
        else
          render json: {errors: new_user.errors.messages}
        end
      end
    
      private
      def user_params
        params.permit(:name, :email, :password, :password_confirmation)
      end
    end
  end