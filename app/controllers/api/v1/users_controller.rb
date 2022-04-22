module Api
  module V1 
    
    class UsersController < ApplicationController
      before_action :set_user, only: [:show, :update, :destroy]
    
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
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def create_escort
        ActiveRecord::Base.transaction do 
          phone = params[:user][:phone]
          if Escort.find_by(phone: phone)
            render json: { error: 'Celular ya se encuentra registrado'},  status: :unprocessable_entity
            return
          end  
          user = User.new(user_params)
          user.add_role(:escort)
          if user.save
            escort = Escort.new(username: user.username, phone: phone)
            escort.user = user
            escort.save
            render json: user, status: :ok
          else
            render json: user.errors, status: :unprocessable_entity
          end
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

      def current
        if current_user
          if current_user.has_role?(:escort)
            escort =  current_user.escort
            data = {
              escort: escort,
              categories: !escort.categories.blank? ? escort.categories.map { |x| {value: x.id, label: x.name} }  : [] ,
              activities: !escort.activities.blank? ? escort.activities.map { |x| {value: x.id, label: x.name} } : [],
              locations: !escort.locations.blank? ? escort.locations.map { |x| {value: x.id, label: x.name} } : [],
              photos: escort.photos.attached? ? escort.photos.map { |x|  {id:x.id, url: rails_blob_url(x)} } : [],
              avatar: escort.avatar.attached? ? rails_blob_url(escort.avatar) : ""
            }
            render json: data
          end
        else
          render json: {error: "not user"}
        end
      end
          
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def user_params
          params.require(:user).permit(:username, :email, :password, :password_confirmation)
        end
    end

  end
end

