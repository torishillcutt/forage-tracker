class ExpeditionsController < ApplicationController

    def show
        @expedition = Expedition.find_by(id: params[:id])
    end

    def new
        @expedition = Expedition.new
    end

    def create
        @expedition = Expedition.new(Expedition_params(:location_name, :date_and_time, :picture, :latitude, :longitude, :description, :user = [:name]))
        render_or_redirect(:new)
    end

    def edit
        @expedition = Expedition.find_by(id: params[:id])
    end

    def edit
        @expedition = Expedition.find_by(id: params[:id])
      end
    
      def update
        @expedition = Expedition.find_by(id: params[:id])
        @expedition.update(Expedition_params(:location_name, :date_and_time, :picture, :latitude, :longitude, :description))
        render_or_redirect(:edit)
      end

    private

    def Expedition_params(*args)
        params.require(:expedition).permit(*args)
    end

    def render_or_redirect(page)
    if @expedition.save
        redirect_to Expedition_path(@expedition)
      else
        render page
      end
    end
end
