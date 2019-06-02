require 'rails_helper'

describe 'Google Geocoding Service' do
  it "gets lat/long from a city and state" do
    response = GoogleGeocodingService.new("Denver, CO")

    location = response.location

    expect(location).to be_a(Hash)
    expect(location['lat']).to be_within(0.01).of(39.7392358)
    expect(location['lng']).to be_within(0.01).of(-104.990251)
  end
end
