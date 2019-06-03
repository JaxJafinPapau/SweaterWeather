class DailyWeather
  attr_reader :day,
              :summary,
              :precip_chance,
              :high_temperature,
              :low_temperature

  def initialize(daily_forecast)
    @day = date_formatter(daily_forecast['time'])
    @summary = daily_forecast['summary']
    @precip_chance = daily_forecast['precipProbability']
    @high_temperature = daily_forecast['temperatureHigh'].round
    @low_temperature = daily_forecast['temperatureLow'].round
  end

  private

    def date_formatter(date)
      DateTime.new(date).strftime("%A")
    end
end
