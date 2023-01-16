//
//  WeatherFetchingProtocol.swift
//  Weather App
//
//  Created by Chinyiu Chau on 15.01.23.
//

import Foundation

protocol WeatherServiceProtocol {
    func getCurrentWeather(location: String) async throws -> Result<WeatherRawData, ServiceError>
}
