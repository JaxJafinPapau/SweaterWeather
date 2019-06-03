class AntipodeFacade
  attr_reader :id
  def initialize(params)
    @params = params
    @id = 0
  end

  def antipode_weather
    AntipodeWeather.new(parsed_weather, antipode_text_location.reverse_geocode, @params[:loc])
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

    def parsed_weather
      weather = dark_sky.weather
      {
        'summary' => weather['currently']['summary'],
        'current_temperature' => weather['currently']['temperature']
      }
    end
end
