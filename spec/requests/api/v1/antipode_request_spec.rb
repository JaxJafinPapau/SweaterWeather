require 'rails_helper'

describe 'Antipode end point' do
  it 'should return the weather at the antipode of a location' do
    get '/api/v1/antipode?loc=hongkong'

    expect(response).to be_successful

    weather = JSON.parse(response.body)
    expect(weather['data']).to be_truthy
    current_weather = weather['data']['attributes']['antipode_weather']
    expect(current_weather['summary']).to be_a(String)
    expect(current_weather['temperature']).to be_a(Numeric)
    expect(current_weather['daily_high']).to be_a(Numeric)
    expect(current_weather['daily_low']).to be_a(Numeric)
    expect(current_weather['location']).to be_a(String)
    expect(current_weather['datetime']).to be_a(String)
  end
end
#
# An antipode is the point on the planet that is diametrically opposite.
#
# You will create an endpoint like so:, `/api/v1/antipode?loc=hongkong`
#
# You will use the `Amypode API` to determine the antipode for Hong Kong.
#
# [`http://amypode.herokuapp.com/api/v1/antipodes?lat=27&long=-82`]
#
# This is a sample request. Amypode API requires header based authentication. It expects the  `api_key` header to be set to your key, which is `oscar_the_grouch`
#
# Your endpoint will give the user the original city, and the antipode's location name and its current weather summary and current temperature.
#
# To retrieve the antipode's name use something like Google's reverse geocoding documented here: https://developers.google.com/maps/documentation/geocoding/start
#
# You should reuse the code you have currently written for retrieving weather.
#
# Your response should resemble the structure and contain the following data:
#
# ```
# {
#     "data": [
#         {
#             "id": "1",
#             "type": "antipode",
#             "attributes": {
#                 "location_name": "Antipode City Name",
#                 "forecast": {
#                     "summary": "Mostly Cloudy,
#                     "current_temperature": "72",
#                 				},
#             "search_location": "Hong Kong"
#             }
#         }
#     ]
# }
