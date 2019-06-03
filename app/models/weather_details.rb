class WeatherDetails
  attr_reader :summary,
              :today_forecast,
              :tonight_forecast,
              :feels_like,
              :humidity,
              :visibility,
              :uv_index
  def initialize(raw_weather_data)
    @summary = raw_weather_data['currently']['summary']
    @today_forecast = raw_weather_data['minutely']['summary']
    @today_forecast = raw_weather_data['hourly']['summary']
    @feels_like = raw_weather_data['currently']['apparentTemperature']
    @humidity = raw_weather_data['currently']['humidity']
    @visibility = raw_weather_data['currently']['visibility']
    @uv_index = raw_weather_data['currently']['uvIndex']
  end
end
