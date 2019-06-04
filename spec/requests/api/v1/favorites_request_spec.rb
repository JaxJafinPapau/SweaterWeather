require 'rails_helper'

describe 'Weather API' do
  it "creates a favorite when given a post request with proper params" do
    test_user_data = {
                      "email": "whatever@example.com",
                   "password": "password"
    }.to_json

    headers = { "CONTENT_TYPE" => "application/json" }

    user = create(:user, email: "whatever@example.com", password: "password", api_key: '12345')
    city = create(:city, name: "denver", state: "co", latitude: 39.7392358, longitude: -104.990251)

    post "/api/v1/sessions", params: test_user_data, headers: headers

    test_favorite_data = {
        "location": city.id,
        "api_key": user.api_key
    }.to_json

    post "/api/v1/favorites", params: test_favorite_data, headers: headers

    expect(response.status).to eq(200)

    new_favorite = JSON.parse(response.body)

    expect(new_favorite['data']).to be_truthy
    expect(new_favorite['data']['attributes']).to be_a(Array)
    expect(new_favorite['data']['attributes'][0]['location']).to eq("Denver, CO")
    expect(new_favorite['data']['attributes'][0]['current_weather']).to be_a(Hash)
  end
end
