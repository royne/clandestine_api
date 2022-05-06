module Api
  module V1
    class SearchController < ApplicationController

      def index
        escorts = params[:category_ids].present? ? Escort.joins(:categories).where("categories.id = ?", params[:category_ids]) : Escort.all
        escorts = a.joins(:activities).where("activities.id = ?", params[:activity_ids]) if params[:activity_ids].present? 
        escorts = a.joins(:locations).where("locations.id = ?", params[:location_ids]) if params[:location_ids].present? 
        render json: escorts
        
      end
      
    end
  end
end