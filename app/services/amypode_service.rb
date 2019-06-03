class AmypodeService
  def initialize(location)
    @location = location
  end

  def location
    get_json['data']['attributes']
  end

  private

    def get_json
      response = conn.get
      JSON.parse(response.body)
    end

    def conn
      Faraday.new("http://amypode.herokuapp.com/api/v1/antipodes") do |f|
        f.params[:lat] = @location['lat']
        f.params[:long] = @location['lng']
        f.headers[:api_key] = ENV['AMYPODE_KEY']
        f.adapter Faraday.default_adapter
      end
    end
end
