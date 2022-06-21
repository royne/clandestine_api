module Api
  module V1 

    class EscortsController < ApplicationController
      before_action :set_escort, only: [:show, :update, :destroy, :counter]

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
        activities = Activity.all
        locations = Location.all
        categories = Category.all
        options = {activities: [], locations: [], categories: []}
        activities.map { |x| options[:activities].push({label: x.name, value: x.id})}
        locations.map { |x| options[:locations].push({label: x.name, value: x.id})}
        categories.map { |x| options[:categories].push({label: x.name, value: x.id})}

        render json: options 
      end

      def randon_premium
        escorts = Escort.all.includes(:photos_attachments, :avatar_attachment)
        number_photos = 3
        number_elm = escorts.size * number_photos
        arr = []
        escorts.each do |escort| 
          escort.photos.each { |x| arr.push({id: escort.id, username: escort.username, photo: transform_image(x, 600), avatar: transform_image(escort.avatar, 60), visit_counter: escort.visit_counter })}
        end
        data = arr.shuffle
        render json: data.shuffle
      end

      def counter
        @escort.update(visit_counter: @escort.visit_counter + 1)
      end
      
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_escort
          @escort = Escort.includes(:categories, :activities, :locations).find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def escort_params
          params.require(:escort).permit(:username, :first_name, :last_name, :city, :description, :price, :stars, :sex, :age, :phone, :user_id, :avatar, :visit_counter,
            :photos => [], :activity_ids => [], :location_ids => [], :category_ids => [])
        end

    end

  end
end