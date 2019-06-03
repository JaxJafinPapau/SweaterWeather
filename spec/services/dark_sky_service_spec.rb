require 'rails_helper'

describe 'Dark Sky Service' do
  it 'should retrieve weather data when given a lat/long' do
    location = {
                "lat" => "39.7392358",
                "lng" => "-104.990251"
              }

    response = DarkSkyService.new(location)
    weather = response.weather

    expect(weather).to be_a(Hash)
    expect(weather["timezone"]).to eq("America/Denver")
    expect(weather["minutely"]).to be_a(Hash)
  end
end
