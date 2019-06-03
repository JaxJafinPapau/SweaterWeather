class FlickrService
  def initialize(location)
    @location = location
  end

  def backgrounds
    response = conn.get
    JSON.parse(response.body)
  end

  private

      def conn
        Faraday.new("https://api.flickr.com/services/rest/") do |f|
          f.params[:api_key] = ENV['FLICKR_KEY']
          f.params[:method] = "flickr.photos.search"
          f.params[:tags]  = "#{formatted_location},skyline,weather"
          f.params[:text] = "#{formatted_location}"
          f.params[:safe_search] = 1
          f.params[:format] = "json"
          f.params[:nojsoncallback] = 1
          f.adapter Faraday.default_adapter
        end
      end

      def formatted_location
        @location.downcase.gsub(" ", "")
      end
end
