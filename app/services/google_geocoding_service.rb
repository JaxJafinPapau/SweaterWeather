class GoogleGeocodingService
  def initialize(location)
    @location = location
  end

  def lat_long_location
    get_json['results'].first['geometry']['location']
  end

  def user_formatted_location
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
        f.params[:address] = formatted_location
        f.adapter Faraday.default_adapter
      end
    end

    def formatted_location
      @location.downcase.gsub(" ", "")
    end

end
