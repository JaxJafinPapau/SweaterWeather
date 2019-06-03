class DarkSkyService
  def initialize(location)
    @location = location
  end

  def weather
    JSON.parse(conn.body)
  end

  private

      def conn
        Faraday.get("https://api.darksky.net/forecast/#{ENV['DARKSKY_KEY']}/#{latitude},#{longitude}")
      end

      def latitude
        @location["lat"]
      end

      def longitude
        if @location["lng"]
          @location["lng"]
        elsif @location["long"]
          @location["long"]
        end
      end
end
