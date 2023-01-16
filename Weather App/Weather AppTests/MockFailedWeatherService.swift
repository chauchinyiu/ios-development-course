//
//  MockFailedWeatherService.swift
//  Weather AppTests
//
//  Created by Chinyiu Chau on 15.01.23.
//

import Foundation

class MockJSONFailedWeatherSerice: WeatherServiceProtocol {
    
    func getCurrentWeather(location: String) async throws -> Result<WeatherRawData, ServiceError> {
        return .failure(.decodeError)
    }
}

class MockNoDataFailedWeatherSerice: WeatherServiceProtocol {
    
    func getCurrentWeather(location: String) async throws -> Result<WeatherRawData, ServiceError> {
        return .failure(.noDataFound)
    }
}

class MockURLFailedWeatherSerice: WeatherServiceProtocol {
    
    func getCurrentWeather(location: String) async throws -> Result<WeatherRawData, ServiceError> {
        return .failure(.urlFailed)
    }
}
