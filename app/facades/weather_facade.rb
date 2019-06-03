class WeatherFacade
  attr_reader :id
  def initialize(params)
    @params = params
    @id = 0
  end

  def current_weather
    CurrentWeather.new(dark_sky.weather, location.strf_description)
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

  def daily_forecast
    dailies = dark_sky.weather['daily']['data'].first(5)
    dailies.map do |daily|
      DailyWeather.new(daily)
    end
  end

  private

    def google
      @_location ||= GoogleGeocodingService.new(@params[:location])
    end

    def dark_sky
      @_weather ||= DarkSkyService.new(location)
    end

    def location
      city = City.find_by(name: city_description[0], state: city_description[1])
      return city if city
      City.create(name: city_description[0],
                  state: city_description[1],
                  latitude: google.lat_long_location['lat'],
                  longitude: google.lat_long_location['lng'],
                  strf_description: google.user_formatted_location
                 )
    end

    def city_description
      @params[:location].split(",")
    end
end
