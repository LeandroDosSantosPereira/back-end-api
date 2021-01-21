class Api::V1::TicketsController < ApplicationController
    # before_action :authenticate_request!, except: [:create, :login] # Exclude this route from authentication
    before_action :authenticate_request!
    before_action :set_ticket, only: [:show, :update, :destroy]

    # GET /users
    def index
      @tickets = Ticket.all
      render json: @tickets
    end
  
    # GET /users/1
    def show  
      @ticket = Ticket.find(params[:id])
      render json: @ticket
    end
  
    # POST /users
    def create
      @ticket = Ticket.new(ticket_params)
      
      # Verifica para qual usuário deve ser enviado o e-mail
      @users = User.all
      @users.each do |user| 
       if user.id == @ticket.ads_id
        @email_to = user.email
       end
      end 
      
      if @ticket.save        
        # TicketCreatedMailer.open_call(@ticket,  @email_to).deliver
        # render json: @user, status: :created, location: @user
        render json: @ticket
      else
        render json: @ticket.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /users/1
    def update
      # Verifica para qual usuário deve ser enviado o e-mail
      @users = User.all
      @users.each do |user| 
        if user.id == @ticket.ads_id
        @user = user
        end
      end 

      if @ticket.update(ticket_params)
        ApprovedMailer.like_unlike(@ticket,  @user).deliver
        render json: @ticket
      else
        render json: @ticket.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /users/1
    def destroy
      @ticket.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_ticket
        @ticket = Ticket.find(params[:id])
      end

      def ticket_params
        params.require(:ticket).permit(:title, :user_id, :ads_id, :image, :text, :approval)
        # params.permit(:title, :user_id, :ads_id)
      end
  
end
