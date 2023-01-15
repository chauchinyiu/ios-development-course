//
//  WeatherViewModel.swift
//  Weather App
//
//  Created by Chinyiu Chau on 11.01.23.
//

import Foundation
import Combine
import CoreLocation
import CoreFoundation


class WeatherViewModel: ObservableObject {
    private var weatherService: WeatherFetching
    @Published private var weatherModel: WeatherModel?
    @Published private(set) var isLoading: Bool = false
    
    
    var error : ServiceError?
    var location: String? {
        get { weatherModel?.locationName}
    }
    
    init(weatherFetching: WeatherFetching) {
        weatherService = weatherFetching
    }
         
    var weatherMain: String? {
        get { weatherModel?.weatherName}
    }
    
    var description: String? {
        get { weatherModel?.description}
    }
    
    var temperature: String? {
        get { String(format: "%.1f",  weatherModel?.temperature ?? 0) + "°C"}
    }
    
    var iconURLString: String? {
        get {
            guard let iconCode = weatherModel?.icon else {
                return nil
            }
            
            return "https://openweathermap.org/img/wn/\(iconCode)@2x.png"
        }
    }
    
    var locationTime: String? {
        get {
            
            guard let timeOff = weatherModel?.timeOffUtc else {
                return nil
            }
            let utcDateFormatter = DateFormatter()
            utcDateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            utcDateFormatter.timeStyle = .medium
            let now = Date().addingTimeInterval(timeOff)
            let dateString = utcDateFormatter.string(from: now)
            return dateString
        }
    }
 
    @MainActor
    func weather(location: String) async {
        isLoading = true
        error = nil
        do {
            let result = try await self.weatherService.getCurrentWeather(location: location)
            if case .success(let rawWeather) = result {
                weatherModel = WeatherModel(data: rawWeather)
            }else if case .failure(let err) = result {
                error = err
            }
        } catch {
            print("Something else wrong")
          
        }
        isLoading = false
       
       
    }
}
 
