module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_request!, except: [:create, :login] # Exclude this route from authentication
      before_action :set_user, only: [:show, :update, :destroy]
    
      def login    
        user = User.find_by(email: user_params[:email].to_s.downcase)
        if user&.authenticate(user_params[:password])
          token = JsonWebToken.encode(user_id: user.id)
          user.to_json 
          render json: { token: token}
        else
          render json: { error: 'Invalid username/password' }, status: :unauthorized
        end
      end
    
      # GET /users
      def index
        @users = User.all
        render json: @users
      end
    
      # GET /users/1
      def show
        render json: @user
      end
    
      # POST /users
      def create
        @user = User.new(user_params)
    
        if @user.save
          # render json: @user, status: :created, location: @user
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /users/1
      def update
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /users/1
      def destroy
        @user.destroy
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.find(params[:id])
        end
    
        # Only allow a trusted parameter "white list" through.
        def user_params
          params.require(:user).permit(:name, :email, :password, :password_confirmation, :photo)
          # params.permit(:name, :email, :password, :password_confirmation)
        end
    end		
	end
end