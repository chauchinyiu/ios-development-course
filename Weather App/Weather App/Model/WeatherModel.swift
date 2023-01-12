//
//  WeatherModel.swift
//  Weather App
//
//  Created by Chinyiu Chau on 12.01.23.
//

 

struct WeatherModel {
    var locationName: String
    var weatherName: String
    var description: String
    var temperature: Double
    var timeOffUtc: Double //timezone Shift in seconds from UTC
    var icon: String
    init (data: WeatherRawData) {
        locationName = data.name
        weatherName = data.weather.first?.main ?? ""
        description = data.weather.first?.description ?? ""
        temperature = data.main.temp
        timeOffUtc = data.timezone
        icon = data.weather.first?.icon ?? ""
    }
}

struct WeatherRawData : Codable {
    var name: String
    var timezone: Double
    var weather: [WeatherData]
    var main: MainData
    var wind: WindData
    var clouds: CloudsData
    
    struct WeatherData: Codable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }
    
    struct MainData: Codable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindData: Codable {
        var speed: Double
        var deg: Double
    }
    
    struct CloudsData: Codable {
        var all: Double
    }
}
