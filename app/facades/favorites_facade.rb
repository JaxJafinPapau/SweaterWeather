class FavoritesFacade
  attr_reader :id
  def initialize(params)
    @params = params
    @id = 0
  end

  def favorites
    create_favorite if @params[:action] == 'create'
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
end
