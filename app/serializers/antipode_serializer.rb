class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :antipode_weather
end
