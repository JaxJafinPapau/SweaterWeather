class Forecast
  attr_reader :summary,
              :current_temperature
  def initialize(weather)
    @summary = weather['summary']
    @current_temperature = weather['current_temperature']
  end
end
