require 'rails_helper'

describe 'Weather API' do
  it "creates a session when given a post request with proper params" do
    test_user_data = {
                      "email": "whatever@example.com",
                   "password": "password"
    }.to_json

    create(:user, email: "whatever@example.com", password: "password", api_key: '12345')

    headers = { "CONTENT_TYPE" => "application/json" }

    post "/api/v1/sessions", params: test_user_data, headers: headers

    expect(response).to be_successful
    expect(response.status).to be(200)
    raw_key = JSON.parse(response.body)
    expect(raw_key['data']['attributes']['api_key']).to eq('12345')
  end
end
