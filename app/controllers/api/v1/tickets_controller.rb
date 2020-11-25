class Api::V1::TicketsController < ApplicationController
    # before_action :authenticate_request!, except: [:create, :login] # Exclude this route from authentication
    before_action :authenticate_request!
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
      puts @ticket
      if @ticket.save
        # render json: @user, status: :created, location: @user
        render json: @ticket
      else
        render json: @ticket.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /users/1
    def update
      if @ticket.update(ticket_params)
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
        params.require(:ticket).permit(:title, :user_id, :ads_id, :image)
        # params.permit(:title, :user_id, :ads_id)
      end
  
end
