//
//  CurrentWeatherModel.swift
//  WeatherReport
//
//  Created by naswakhansa on 30/09/24.
//

import Foundation

struct CurrentWeatherModel: Decodable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let dt: Int
    let id: Int
    let name: String
    
    var date: String {
        let date: Date = Date(timeIntervalSince1970: TimeInterval(dt))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.string(from: date)
    }
}

struct Coord: Decodable {
    let lon: Double
    let lat: Double
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Decodable {
    let temp: Double
    let pressure: Int
    let humidity: Int
    let seaLevel: Int
    let grndLevel: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case pressure
        case humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
    
    var temperature: Int {
        let temp = temp - 273.15
        return Int(temp)
    }
}

struct Wind: Decodable {
    let speed: Double
    let deg: Int?
    
    var speedString: String {
        return String(format: "%.2f", speed)
    }
}

enum WeatherIcon: String {
    case clearSky = "sun.max"
    case fewClouds = "cloud.sun"
    case scatteredClouds = "cloud"
    case brokenClouds = "cloud.fill"
    case showerRain = "cloud.drizzle"
    case rain = "cloud.rain"
    case thunderstorm = "cloud.bolt.rain"
    case snow = "snow"
    case mist = "cloud.fog"

    init(weatherID: Int) {
        switch weatherID {
        case 200...232:
            self = .thunderstorm
        case 300...321:
            self = .showerRain
        case 500...531:
            self = .rain
        case 600...622:
            self = .snow
        case 701...781:
            self = .mist
        case 800:
            self = .clearSky
        case 801:
            self = .fewClouds
        case 802...804:
            self = .brokenClouds
        default:
            self = .clearSky // Default case
        }
    }
}





