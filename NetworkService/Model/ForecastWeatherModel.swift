//
//  ForecastWeatherModel.swift
//  WeatherReport
//
//  Created by naswakhansa on 30/09/24.
//

import Foundation

// MARK: - Forecast
struct ForecastWeatherModel: Decodable {
    let cod: String
    let message, cnt: Int
    let list: [List]
}

// MARK: - List
struct List: Decodable {
    let dt: Int
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility, pop: Int
    let sys: Sys
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
    }
}

