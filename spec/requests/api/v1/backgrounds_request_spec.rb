require 'rails_helper'

describe 'Weather API' do
  it "gets the background based on the city" do
    city = create(:city, name: "denver", state: "co", latitude: 39.7392358, longitude: -104.990251)

    get "/api/v1/backgrounds?location=denver,co"

    expect(response).to be_successful
    weather = JSON.parse(response.body)
    expect(weather['data']).to be_truthy
    expect(weather['data']['attributes']['backgrounds']).to be_a(String)
  end
end
