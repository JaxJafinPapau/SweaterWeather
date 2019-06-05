# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Favorite.destroy_all
City.destroy_all
User.destroy_all

user = User.create(email: "whatever@example.com", password: "password", api_key: '12345')
city_1 = City.create(name: "denver", state: "co", latitude: 39.7392358, longitude: -104.990251)
city_2 = City.create(name: "seattle", state: "wa", latitude: 47.596174, longitude: -122.327693, strf_description: "Seattle, WA")
favorite_1 = user.favorites.create(city_id: city_1.id)
favorite_1 = user.favorites.create(city_id: city_2.id)
