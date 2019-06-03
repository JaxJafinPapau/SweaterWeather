class CurrentWeather
  attr_reader :summary,
              :temperature,
              :daily_high,
              :daily_low,
              :location,
              :datetime
              :id
  def initialize(raw_weather_data, location)
        @summary = raw_weather_data['currently']['summary']
    @temperature = raw_weather_data['currently']['temperature']
     @daily_high = raw_weather_data['daily']['data'].first['temperatureHigh'].round
      @daily_low = raw_weather_data['daily']['data'].first['temperatureLow'].round
       @location = location
       @datetime = DateTime.now.strftime("%l:%M %p, %_m/%-d")
             @id = 0
  end
end
