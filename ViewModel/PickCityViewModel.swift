//
//  PickCityViewModel.swift
//  WeatherReport
//
//  Created by naswakhansa on 04/10/24.
//

import Foundation
import Combine


class PickCityViewModel: ObservableObject {
    let apiService: WeatherService
    @Published var searchCity: String = ""
    @Published var cities: [LocationModel] = []
    @Published var filteredCities: [LocationModel] = []

    
    init() {
        self.apiService = WeatherService()
    }
    
    func searchLocationCity() {
        apiService.searchLocation(nameLocation: searchCity) { result in
            DispatchQueue.main.async {
                if case .success(let cities) = result {
                    self.cities = cities
                    self.filterCities()
                    print(cities)
                } else if case .failure(let error) = result {
                    print(error)
                }
            }
        }
    }
    
    func filterCities() {
        var seenNames = Set<String>()
        filteredCities = cities.filter { location in
            if seenNames.contains(location.name) {
                return false
            } else {
                seenNames.insert(location.name)
                return true
            }
        }
    }
}

