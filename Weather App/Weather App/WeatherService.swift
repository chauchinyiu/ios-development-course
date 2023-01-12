//
//  WeatherService.swift
//  Weather App
//
//  Created by Chinyiu Chau on 11.01.23.
//

import Foundation
import CoreLocation
import FileProvider

class WeatherService {
 
    static func getCurrentWeather(city: String) async throws -> Result<WeatherRawData, ServiceError>  {
     
        let city_clean = city.replacingOccurrences(of: " ", with: "%20")
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city_clean)&units=metric&appid=aee9d4df2adaf52155be159b7c546636") else {
            return .failure(.urlFailed)
        }
        
        // Call the API asynchronously and wait for the response
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            return .failure(.noDataFound)
        }
        
        return loadJson(data)
    }
    
    static func loadJson(_ data: Data) -> Result<WeatherRawData, ServiceError>  {
         do {
             let weatherRawData = try JSONDecoder().decode(WeatherRawData.self, from: data)
             return .success(weatherRawData)
         } catch {
             return .failure(.decodeError)
         }
     }
}

enum ServiceError: Error {
    case urlFailed
    case noDataFound
    case decodeError
 
    var errorDescription: String {
        switch self {
            case .urlFailed:
                return "URL is failed"
            case .noDataFound:
                return "No data can be retrieved with this location"
            case .decodeError:
                return "Unable to decode the WeatherRawData"
 
        }
     
    }
}
