class Api::V1::ForecastController < ApplicationController
  def index
    facade = WeatherFacade.new(params)
    render json: WeatherSerializer.new(facade)
  end
end
