class WeatherFacade
  def initialize(params)
    @params = params
  end

  def current_weather
    CurrentWeather.new(weather)
  end

  private

    def location
      @_location ||= GoogleGeocodingService.new(@params[:location])
    end

    def weather
      @_weather ||= DarkSkyService.new(location)
    end
end
