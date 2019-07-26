module API
    class UsersController < ApplicationController
      def index
        @users = User.all
  
        render json: { posts: @users }
      end

      def show
        render json: {user: User.find(params[:id])}
      end

    #   def create
    #     render json: { params: params }
    #   end
    end
  end