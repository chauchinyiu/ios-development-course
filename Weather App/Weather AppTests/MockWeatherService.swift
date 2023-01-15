//
//  MockWeatherService.swift
//  Weather AppTests
//
//  Created by Chinyiu Chau on 15.01.23.
//

import Foundation

class MockWeatherSerice: WeatherFetching {
    private let jsonString = """
{
    "weather": [
        {
            "id": 800,
            "main": "Clear",
            "description": "clear sky",
            "icon": "01d"
        }
    ],
    "main": {
        "temp": 9.4,
        "feels_like": 8.71,
        "temp_min": 7.22,
        "temp_max": 11.11,
        "pressure": 1023,
        "humidity": 100,
        "sea_level": 100
    },
    "wind": {
        "speed": 1.5,
        "deg": 350
    },
    "clouds": {
        "all": 1
    },
    "timezone": -25200,
    "name": "Mountain View"
}
"""

    func getCurrentWeather(location: String) async throws -> Result<WeatherRawData, ServiceError> {

        let jsonData = jsonString.data(using: .utf8)!

        let resultData = try JSONDecoder().decode(WeatherRawData.self, from: jsonData)
        return .success(resultData)
    }
}
