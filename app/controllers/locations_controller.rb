class LocationsController < ApplicationController
  def index
    @locations = Location.where.not(latitude: nil, longitude: nil)
    @markers = @locations.map do |location|
          {
            long: location.longitude,
            lat: location.latitude
          }
    end
  end

  def new
  end

  def create
  end

  def show
    @location = Location.find(params[:id])
  end

  def zoom
    @place = params[:place]
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
