class WeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :current_weather
end
