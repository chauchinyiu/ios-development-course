//
//  MockFailedWeatherService.swift
//  Weather AppTests
//
//  Created by Chinyiu Chau on 15.01.23.
//

import Foundation

class MockJSONFailedWeatherSerice: WeatherFetching {
    
    func getCurrentWeather(location: String) async throws -> Result<WeatherRawData, ServiceError> {
        return .failure(.decodeError)
    }
}

class MockNoDataFailedWeatherSerice: WeatherFetching {
    
    func getCurrentWeather(location: String) async throws -> Result<WeatherRawData, ServiceError> {
        return .failure(.noDataFound)
    }
}

class MockURLFailedWeatherSerice: WeatherFetching {
    
    func getCurrentWeather(location: String) async throws -> Result<WeatherRawData, ServiceError> {
        return .failure(.urlFailed)
    }
}
