require 'rails_helper'

describe 'Weather API' do
  it "gets the background based on the city" do
    city = create(:city, name: "Denver", state: "CO")

    get "/api/v1/backgrounds?location=denver,co"

    expect(response).to be_successful
    weather = JSON.parse(response.body)
    expect(weather['data']).to be_truthy
  end
end
