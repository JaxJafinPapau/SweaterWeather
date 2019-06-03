class WeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :current_weather,
             :details,
             :hourly_forecast
end
