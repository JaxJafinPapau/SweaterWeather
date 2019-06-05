require 'rails_helper'

describe 'Weather API' do
  it "creates a favorite when given a post request with proper params" do
    test_user_data = {
                      "email": "whatever@example.com",
                   "password": "password"
    }.to_json

    headers = { "CONTENT_TYPE" => "application/json" }

    user = create(:user, email: "whatever@example.com", password: "password", api_key: '12345')
    city_1 = create(:city, name: "denver", state: "co", latitude: 39.7392358, longitude: -104.990251, strf_description: "Denver, CO")
    city_2 = create(:city, name: "seattle", state: "wa", latitude: 47.596174, longitude: -122.327693, strf_description: "Seattle, WA")
    favorite_1 = user.favorites.create(city_id: city_1.id, user_id: user.id)
    favorite_2 = user.favorites.create(city_id: city_2.id, user_id: user.id)

    expect(user.favorites.count).to eq(2)

    post "/api/v1/sessions", params: test_user_data, headers: headers

    test_favorite_data = {
        "location": city_1.id,
         "api_key": user.api_key
    }.to_json

    delete "/api/v1/favorites", params: test_favorite_data, headers: headers

    expect(response.status).to eq(200)

    one_less_favorite = JSON.parse(response.body)
    expect(one_less_favorite['data']).to be_truthy
    expect(one_less_favorite['data']['attributes']['favorites']['message']).to eq("Favorite successfully deleted.")
    expect(user.favorites.count).to eq(1)
  end
end
