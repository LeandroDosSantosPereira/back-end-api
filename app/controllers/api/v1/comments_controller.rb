class Api::V1::CommentsController < ApplicationController
    # before_action :authenticate_request!, except: [:create, :login] # Exclude this route from authentication
    before_action :authenticate_request!
    # GET /users
    def index
      @comments = Comment.all
      render json: @comments
    end
  
    # GET /users/1
    def show  
      @comment = Comment.find(params[:id])
      render json: @comment
    end
  
    # POST /users
    def create
      @comment = Comment.new(comment_params)
      puts @comment
      if @comment.save
        # render json: @user, status: :created, location: @user
        render json: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /users/1
    def update
      if @comment.update(comment_params)
        render json: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /users/1
    def destroy
      @comment.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_comment
        @comment = Comment.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:text, :ticket_id)
        # params.permit(:title, :user_id, :ads_id)
      end
  
end
