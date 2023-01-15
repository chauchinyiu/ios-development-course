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

    func test_weatherLoaded_temperature() async throws {
        let mock = MockWeatherSerice()
        let weatherVm = WeatherViewModel(weatherFetching: mock)

        await weatherVm.weather(location: "london")

        XCTAssertEqual(weatherVm.temperature, "9.4°C")
    }
}
