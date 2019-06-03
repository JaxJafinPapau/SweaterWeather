class AntipodeWeather
  attr_reader :location_name,
              :search_location,
              :forecast
  def initialize(weather, antipode_loc, search_loc)
    @location_name = antipode_loc
    @forecast = Forecast.new(weather)
    @search_location = search_loc.capitalize
  end
end
