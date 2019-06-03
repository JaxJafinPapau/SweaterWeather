class WeatherFacade
  attr_reader :id
  def initialize(params)
    @params = params
    @id = 0
  end

  def current_weather
    CurrentWeather.new(dark_sky.weather, google.user_formatted_location)
  end

  def details
    WeatherDetails.new(dark_sky.weather)
  end

  def hourly_forecast
    hourlies = dark_sky.weather['hourly']['data'].first(8)
    hourlies.map do |hourly|
      HourlyWeather.new(hourly)
    end
  end

  private

    def google
      @_location ||= GoogleGeocodingService.new(@params[:location])
    end

    def dark_sky
      @_weather ||= DarkSkyService.new(google.lat_long_location)
    end
end
