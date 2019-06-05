class Api::V1::FavoritesController < ApplicationController
  def create
    if current_user
      facade = FavoritesFacade.new(favorite_params)
      render status: 200, json: FavoritesSerializer.new(facade)
    else
      render status: 401
    end
  end

  def index
    if current_user && current_user.api_key == get_params[:api_key]
      facade = FavoritesFacade.new(get_params)
      render status: 200, json: FavoritesSerializer.new(facade)
    else
      render status: 401
    end
  end

  def destroy
    if current_user && current_user.api_key == favorite_params[:api_key]
      facade = FavoritesFacade.new(favorite_params)
      render status: 200, json: FavoritesSerializer.new(facade)
    else
      render status: 401
    end
  end

  private

    def favorite_params
      params.permit(:location, :api_key, :action)
    end

    def get_params
      gp = params.permit(:action)
      raw_key = JSON.parse(params.keys.first)
      gp[:api_key] = raw_key['api_key']
      gp
    end
end
