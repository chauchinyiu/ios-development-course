//
//  WeatherView.swift
//  Weather App
//
//  Created by Chinyiu Chau on 12.01.23.
//

import SwiftUI

struct WeatherDetailView: View {
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        List {
            HStack {
                Text("Location")
                    .frame(width:100, alignment: .trailing).padding(.horizontal)
                Text(weatherViewModel.location ?? "")
            }
            HStack {
                Text("Weather")
                    .frame(width:100, alignment: .trailing).padding(.horizontal)
                Text(weatherViewModel.weatherMain ?? "")
                AsyncImage(url: URL(string: weatherViewModel.iconURLString ?? ""))
                
            }
            HStack {
                Text("Description")
                    .frame(width:100, alignment: .trailing).padding(.horizontal)
                Text(weatherViewModel.description ?? "" )
            }
            HStack {
                Text("Temperature")
                    .frame(width:100, alignment: .trailing).padding(.horizontal)
                Text(weatherViewModel.temperature ?? "" )
            }
            HStack {
                Text("Time")
                    .frame(width:100, alignment: .trailing).padding(.horizontal)
                Text(weatherViewModel.locationTime ?? "")
            }
        }
        .listStyle(.plain)
    }
}
