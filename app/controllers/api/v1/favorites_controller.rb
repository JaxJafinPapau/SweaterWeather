class Api::V1::FavoritesController < ApplicationController
  def create
    facade = FavoritesFacade.new(favorite_params)
  end
end
