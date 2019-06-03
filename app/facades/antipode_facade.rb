class AntipodeFacade
  attr_reader :id
  def initialize(params)
    @params = params
    @id = 0
  end

  def antipode_weather
    CurrentWeather.new(dark_sky.weather, antipode_text_location.reverse_geocode)
  end

  private

    def google
      @_location ||= GoogleGeocodingService.new(@params[:loc])
    end

    def amypode
      @_amypode ||= AmypodeService.new(google.lat_long_location)
    end

    def antipode_text_location
      @_antipode_text_location ||= GoogleReverseGeocodingService.new(amypode.location)
    end

    def dark_sky
      @_weather ||= DarkSkyService.new(amypode.location)
    end
end
