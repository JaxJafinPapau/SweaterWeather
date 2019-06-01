class Api::V1::ForecastController < ApplicationController
  def index
    location = GoogleGeocodingService.new(params[:location])
    weather = DarkSkyService.new(location)
    render json: WeatherSerializer.new(weather)
  end
end
