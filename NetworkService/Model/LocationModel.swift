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
}
