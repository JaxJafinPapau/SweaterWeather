class Api::V1::FavoritesController < ApplicationController
  def create
    if current_user
      facade = FavoritesFacade.new(favorite_params)
      render status: 200, json: FavoritesSerializer.new(facade)
    else
      render status: 404
    end
  end

  private

    def favorite_params
      params.permit(:location, :api_key, :action)
    end
end
