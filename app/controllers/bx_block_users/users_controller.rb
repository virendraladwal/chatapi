module BxBlockUsers
    class UsersController < ApplicationController
        before_action :set_user, only: [:show, :update, :destroy]
        skip_before_action :verify_authenticity_token

    
        def index
            @users = User.all
            @users = @users.where("name LIKE ?", "%#{params[:search]}%") if params[:search]
            render json: @users
        end
    
       
        def create
            @user = User.new(user_params)
            if @user.save
              render json: @user, status: :created
            else
              render json: @user.errors, status: :unprocessable_entity
            end
        end
    
       
    
        private
    
        def set_user
         @user = User.find(params[:id])
        end
    
        def user_params
            params.permit(:email, :password, :name, :image)
        end
    end
end