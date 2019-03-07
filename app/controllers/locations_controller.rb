class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @locations = Location.where.not(latitude: nil, longitude: nil)
    @markers = @locations.map do |location|
          {
            long: location.longitude,
            lat: location.latitude,
            image_url: helpers.asset_url('newcurseurmap.png'),
            infoWindow: render_to_string(partial: "infowindow", locals: { location: location })
          }
    end
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.longitude = params[:long]
    @location.latitude = params[:lat]
    @location.user = current_user
    if @location.save
      redirect_to locations_path, notice: 'Success'
    else
      render :new
    end
  end

  def show
    @location = Location.find(params[:id])
    @location.garbage.shift # à régler : le premier string de l'array est vide // input hidden ?
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def location_params
    params.require(:location).permit(:name, :description, :lat, :long, :photo, garbage:[])
    # bien rajouter :[] à la colmun qui est un array
  end
end
