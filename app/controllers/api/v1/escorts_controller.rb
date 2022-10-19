module Api
  module V1 

    class EscortsController < ApplicationController
      include EscortsHelper
      before_action :set_escort, only: [:show, :update, :destroy, :counter]

      # GET /escorts
      def index
        @escorts = Escort.includes(:categories, :locations, :activities, [avatar_attachment: :blob], [photos_attachments: :blob], [user: :roles]).with_attached_avatar.with_attached_photos.all

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
        @escort.category_ids = params[:category_ids] if params[:category_ids].present?
        @escort.activity_ids = params[:activity_ids] if params[:activity_ids].present?
        @escort.location_ids = params[:location_ids] if params[:location_ids].present?

        @escort.avatar = params[:escort][:avatar] if params[:escort][:avatar].present?
        
        if params[:escort][:photos].present?
          files = params[:escort][:photos]
          files.keys.each {|x| @escort.photos.attach(files[x])}
        end
        
        
        if @escort.update(escort_params)
          render json: @escort, status: :ok
        else
          render json: @escort.errors, status: :unprocessable_entity
        end
      end

      # DELETE /escorts/1
      def destroy
        @escort.destroy
      end

      def escorts_selected
        render json: options_for_select 
      end

      def randon_premium
        escorts = Escort.includes(:photos_attachments, :avatar_attachment, [avatar_attachment: :blob], [photos_attachments: :blob], [user: :roles]).with_attached_avatar.with_attached_photos.all
        render json: escorts_randon(escorts)
      end

      def counter
        @escort.increase_visit_counter!
      end
      
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_escort
          @escort = Escort.includes(:categories, :activities, :locations, [avatar_attachment: :blob], [photos_attachments: :blob], [user: :roles]).with_attached_avatar.with_attached_photos.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def escort_params
          params.require(:escort).permit(:username, :first_name, :last_name, :city, :description, :price, :stars, :sex, :age, :phone, :user_id, :avatar, :visit_counter,
            :photos => [], :activity_ids => [], :location_ids => [], :category_ids => [])
        end

    end

  end
end