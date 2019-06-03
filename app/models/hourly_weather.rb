class HourlyWeather
  attr_reader :time,
              :temperature
  def initialize(hourly_forecast)
    @time = time_formatter(hourly_forecast['time'])
    @temperature = hourly_forecast['temperature'].round
  end

  private

    def time_formatter(time)
      Time.at(time).strftime("%l:00 %p")
    end
end
