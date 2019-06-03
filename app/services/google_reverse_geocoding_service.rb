class GoogleReverseGeocodingService
  def initialize(location)
    @location = location
  end

  def reverse_geocode
    get_json['results'].first['formatted_address']
  end

  private

    def get_json
      response = conn.get
      JSON.parse(response.body)
    end

    def conn
      Faraday.new("https://maps.googleapis.com/maps/api/geocode/json") do |f|
        f.params[:key] = ENV['GOOGLE_GEO_KEY']
        f.params[:latlng] = "#{@location['lat']},#{@location['long']}"
        f.adapter Faraday.default_adapter
      end
    end
end
