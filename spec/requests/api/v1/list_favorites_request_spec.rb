require 'rails_helper'

describe 'Weather API' do
  it "lists favorites with a get request with proper params" do
    test_user_data = {
                      "email": "whatever@example.com",
                   "password": "password"
    }.to_json

    headers = { "CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json" }

    user = create(:user, email: "whatever@example.com", password: "password", api_key: '12345')
    city = create(:city, name: "denver", state: "co", latitude: 39.7392358, longitude: -104.990251, strf_description: "Denver, CO")
    favorite = user.favorites.create(city_id: city.id, user_id: user.id)

    post "/api/v1/sessions", params: test_user_data, headers: headers

    test_favorites_data = {
      "api_key": user.api_key
    }

    get "/api/v1/favorites", params: test_favorites_data, headers: headers

    expect(response.status).to eq(200)

    favorites = JSON.parse(response.body)
    expect(favorites['data']).to be_truthy
    expect(favorites['data']['attributes']['favorites'].first['location']).to eq("Denver, CO")
    expect(favorites['data']['attributes']['favorites'].first['current_weather']).to be_a(Hash)
    expect(favorites['data']['attributes']['favorites'].first['current_weather']['temperature']).to be_a(Numeric)
  end
end
