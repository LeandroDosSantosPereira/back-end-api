class Api::V1::CommentsController < ApplicationController
    # before_action :authenticate_request!, except: [:create, :login] # Exclude this route from authentication
    before_action :authenticate_request!
    # GET /users
    def index
      @comments = Comment.all.order(id: :desc)
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

      @ticket = Ticket.find(@comment.ticket_id)

      @user = User.all
     


      if @comment.save

        if @comment.user_id == @ticket.user_id
           #"Para quem recebeu !!!!!!!!!!"
          @user_env = @user.find(@ticket.ads_id)
          @user_from = @user.find(@ticket.user_id)           
          else
          #"Para quem criou !!!!!!!!!!" 
          @user_env = @user.find(@ticket.user_id)
          @user_from = @user.find(@ticket.ads_id)
          end
        # render json: @user, status: :created, location: @user
        CommentCreatedMailer.comment_send(@comment,  @user_env, @user_from).deliver
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
        params.require(:comment).permit(:text, :ticket_id, :image, :user_id)
        # params.permit(:title, :user_id, :ads_id)
      end
  
end
