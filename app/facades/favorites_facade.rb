class FavoritesFacade
  attr_reader :id
  def initialize(params)
    @params = params
    @id = 0
  end

  def favorites
    return create_favorite if @params[:action] == 'create'
    return list_favorites if @params[:action] == 'index'
  end

  private

    def user
      @_user ||= User.find_by(api_key: @params['api_key'])
    end

    def create_favorite
      new_favorite = user.favorites.create(user_id: user.id, city_id: @params['location'])
      {
        location: new_favorite.city.strf_description,
        api_key: user.api_key
      }
    end

    def list_favorites
      user.favorites.map do |favorite|
        {
          :location => favorite.city.strf_description,
          :current_weather => CurrentWeather.new(dark_sky(favorite.city).weather, favorite.city.strf_description)
        }
      end
    end

    def dark_sky(city)
      @_weather ||= DarkSkyService.new(city)
    end
end
