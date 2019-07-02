Sweater Weather is a RESTful JSON API with endpoints that produce weather data to be consumed by a hypothetical front end. It consumes the Dark Sky API for gathering weather data, parses it and returns only what is expected in the project specifications. Location data is parsed from a user friendly city, address, or location by Google Cloud Service's Geocoding API into latitude and longitude. User authentication and location favoriting end points are provided, but not listed here.


GET https://mighty-falls-25575.herokuapp.com/api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json

Response:
```
{
    "data": {
        "id": "0",
        "type": "weather",
        "attributes": {
            "id": 0,
            "current_weather": {
                "summary": "Mostly Cloudy",
                "temperature": 68.69,
                "daily_high": 85,
                "daily_low": 60,
                "location": "Denver, CO",
                "datetime": " 4:24 AM,  7/2",
                "id": 0
            },
            "details": {
                "summary": "Mostly Cloudy",
                "today_forecast": "Foggy tonight.",
                "feels_like": 68.69,
                "humidity": 0.65,
                "visibility": 2.003,
                "uv_index": 0
            },
            "hourly_forecast": [
                {
                    "time": " 4:00 AM",
                    "temperature": 69
                },
                {
                    "time": " 5:00 AM",
                    "temperature": 68
                },
                {
                    "time": " 6:00 AM",
                    "temperature": 67
                },
                {
                    "time": " 7:00 AM",
                    "temperature": 66
                },
                {
                    "time": " 8:00 AM",
                    "temperature": 65
                },
                {
                    "time": " 9:00 AM",
                    "temperature": 63
                },
                {
                    "time": "10:00 AM",
                    "temperature": 62
                },
                {
                    "time": "11:00 AM",
                    "temperature": 60
                }
            ],
            "daily_forecast": [
                {
                    "day": "Saturday",
                    "summary": "Foggy overnight.",
                    "precip_chance": 0.41,
                    "high_temperature": 85,
                    "low_temperature": 60
                },
                {
                    "day": "Saturday",
                    "summary": "Partly cloudy throughout the day.",
                    "precip_chance": 0.22,
                    "high_temperature": 86,
                    "low_temperature": 64
                },
                {
                    "day": "Saturday",
                    "summary": "Partly cloudy throughout the day.",
                    "precip_chance": 0.16,
                    "high_temperature": 88,
                    "low_temperature": 63
                },
                {
                    "day": "Saturday",
                    "summary": "Partly cloudy throughout the day.",
                    "precip_chance": 0.04,
                    "high_temperature": 94,
                    "low_temperature": 65
                },
                {
                    "day": "Saturday",
                    "summary": "Partly cloudy throughout the day.",
                    "precip_chance": 0.04,
                    "high_temperature": 92,
                    "low_temperature": 62
                }
            ]
        }
    }
}
```
