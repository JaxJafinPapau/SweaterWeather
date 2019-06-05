class FavoritesSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id,
             :favorites
end
