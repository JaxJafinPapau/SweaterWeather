class Api::V1::FavoritesController < ApiBaseController
  def create
    if valid_user
      facade = FavoritesFacade.new(favorite_params)
      render status: 200, json: FavoritesSerializer.new(facade)
    else
      render status: 401
    end
  end

  def index
    if valid_user
      facade = FavoritesFacade.new(get_params)
      render status: 200, json: FavoritesSerializer.new(facade)
    else
      render status: 401
    end
  end

  def destroy
    if valid_user
      facade = FavoritesFacade.new(favorite_params)
      render status: 200, json: FavoritesSerializer.new(facade)
    else
      render status: 401
    end
  end

  private

    def valid_user
      User.find_by(api_key: params[:api_key])
    end

    def favorite_params
      params.permit(:location, :api_key, :action)
    end

    def get_params
      params.permit(:api_key, :action)
      # gp = params.permit(:action)
      # raw_key = JSON.parse(params.keys.first)
      # gp[:api_key] = raw_key['api_key']
      # gp
    end
end
