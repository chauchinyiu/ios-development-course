//
//  Weather_AppTests.swift
//  Weather AppTests
//
//  Created by Chinyiu Chau on 11.01.23.
//

import XCTest
@testable import Weather_App

final class Weather_AppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_weather_temperature() async throws {
        let mock = MockWeatherSerice()
        let weatherVM = WeatherViewModel(weatherFetching: mock)

        await weatherVM.weather(location: "london")

        XCTAssertEqual(weatherVM.temperature, "9.4°C")
    }
    
    
    func test_error_nodatafound() async throws {
        let mock = MockNoDataFailedWeatherSerice()
        let weatherVM = WeatherViewModel(weatherFetching: mock)
        await weatherVM.weather(location: "london")
        XCTAssertEqual(weatherVM.error ,  ServiceError.noDataFound)
    }
    
    func test_error_urlfailed() async throws {
        let mock = MockURLFailedWeatherSerice()
        let weatherVM = WeatherViewModel(weatherFetching: mock)
        await weatherVM.weather(location: "london")
        XCTAssertEqual(weatherVM.error ,  ServiceError.urlFailed)
    }
    
    func test_error_decodeFailed() async throws {
        let mock = MockJSONFailedWeatherSerice()
        let weatherVM = WeatherViewModel(weatherFetching: mock)
        await weatherVM.weather(location: "london")
        XCTAssertEqual(weatherVM.error ,  ServiceError.decodeError)
    }
}
