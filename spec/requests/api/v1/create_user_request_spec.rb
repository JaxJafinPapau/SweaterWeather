require 'rails_helper'

describe 'Weather API' do
  it "creates a user when given a post request with proper params" do

    test_user_data = {
                      "email": "whatever@example.com",
                   "password": "password",
      "password_confirmation": "password"
    }.to_json

    headers = { "CONTENT_TYPE" => "application/json" }

    post "/api/v1/users", params: test_user_data, headers: headers

    expect(response).to be_successful
    expect(response.status).to be(201)
    raw_key = JSON.parse(response.body)
    expect(raw_key['data']['attributes']['api_key']).to be_a(String)
  end
end
