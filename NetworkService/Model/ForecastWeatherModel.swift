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
    let message: Int
    let cnt: Int
    let list: [ForecastItem]
    
    enum CodingKeys: String, CodingKey {
        case cod, message, cnt, list
    }
}

// MARK: - List
struct ForecastItem: Decodable {
    let dt: Int
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let rain: Rain?
    let sys: Sys
    let dtTxt: String
    
    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, rain, sys
        case dtTxt = "dt_txt"
    }
    
    var dateTime: Date {
        return Date(timeIntervalSince1970: TimeInterval(dt))
    }
}

struct Clouds: Decodable {
    let all: Int
}


struct Rain: Decodable {
    let threeHour: Double
    
    enum CodingKeys: String, CodingKey {
        case threeHour = "3h"
    }
}

struct Sys: Decodable {
    let pod: String
}
