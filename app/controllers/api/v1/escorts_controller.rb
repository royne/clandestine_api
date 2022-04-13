module Api
  module V1 

    class EscortsController < ApplicationController
      before_action :set_escort, only: [:show, :update, :destroy]

      # GET /escorts
      def index
        @escorts = Escort.all

        render json: @escorts
      end

      # GET /escorts/1
      def show
        render json: @escort
      end

      # POST /escorts
      def create
        @escort = Escort.new(escort_params)

        if @escort.save
          render json: @escort, status: :created, location: @escort
        else
          render json: @escort.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /escorts/1
      def update
        if @escort.update(escort_params)
          render json: @escort
        else
          render json: @escort.errors, status: :unprocessable_entity
        end
      end

      # DELETE /escorts/1
      def destroy
        @escort.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_escort
          @escort = Escort.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def escort_params
          params.require(:escort).permit(:username, :first_name, :last_name, :city, :description, :price, :stars, :sex, :age, :phone, :user_id,
            :activity_ids => [], :location_ids => [], :category_ids => [])
        end
    end

  end
end