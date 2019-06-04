require 'rails_helper'

describe 'Weather API' do
  it "gets the weather based on a city and state" do
    city = create(:city, name: "denver", state: "co", latitude: 39.7392358, longitude: -104.990251)

    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful
    weather = JSON.parse(response.body)
    expect(weather['data']).to be_truthy
  end
end
