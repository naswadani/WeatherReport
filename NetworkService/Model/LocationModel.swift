//
//  LocationModel.swift
//  WeatherReport
//
//  Created by naswakhansa on 30/09/24.
//

import Foundation

struct LocationModel: Decodable {
    let name: String
    let lat, lon: Double
    let country: String
    
    var latitude: String {
        let direction = lat >= 0 ? "N" : "S"
        return "\(abs(lat))° \(direction)"
    }
    
    var longitude: String {
        let direction = lon >= 0 ? "E" : "W"
        return "\(abs(lon))° \(direction)"
    }
}
