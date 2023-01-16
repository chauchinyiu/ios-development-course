//
//  Weather_AppApp.swift
//  Weather App
//
//  Created by Chinyiu Chau on 11.01.23.
//

import SwiftUI

@main
struct WeatherApp: App {
  
    var body: some Scene {
        WindowGroup {
           WeatherView(weatherViewModel: WeatherViewModel(service: WeatherService()))
        }
    }
}
