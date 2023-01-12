//
//  ContentView.swift
//  Weather App
//
//  Created by Chinyiu Chau on 11.01.23.
//

import SwiftUI
struct Location: Identifiable {
    let id = UUID()
    let name: String
}

struct WeatherView: View {
    @ObservedObject var weatherViewModel: WeatherViewModel
    @State var citytext: String = ""

    var body: some View {
        VStack() {
            ZStack {
                Color.white.ignoresSafeArea()
                VStack(alignment: .leading) {
                    Text("Location Name: ").font(.title2)
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search", text: $citytext)
                            .submitLabel(.search)
                            .onSubmit {
                                Task {
                                    await weatherViewModel.weather(city: citytext)
                                }
                            }
                    }
                    .underlineTextField()
                }
            }
            .frame(width: 300, height: 150)
            
            if weatherViewModel.isLoading
            {
                Spacer().frame(height:100)
                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .blue))
            } else {
                if weatherViewModel.error != nil {
                    Spacer().frame(height:100)
                    Text(weatherViewModel.error?.errorDescription ?? "unknown error")
                }
                else {
                    CityWeatherDetailView(weatherViewModel: weatherViewModel)
                }
            }
            Spacer()
        }
        
    }
}

extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(Color(red: 0.4627, green: 0.8392, blue: 1.0))
            .padding(10)
    }
}
