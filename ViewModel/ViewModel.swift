//
//  PickCityViewModel.swift
//  WeatherReport
//
//  Created by naswakhansa on 04/10/24.
//

import Foundation

class ViewModel: ObservableObject {
    let apiService: WeatherService
    @Published var searchCity: String = ""
    @Published var cities: [LocationModel] = []
    @Published var filteredCities: [LocationModel] = []
    @Published var currentWeather: CurrentWeatherModel?
    @Published var errorMessage: String?

    init() {
        self.apiService = WeatherService()
    }
    
    func fetchWeatherReport(lon: Double, lat: Double) {
        apiService.fetchCurrentWeather(lon: lon, lat: lat) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weather):
                    self.currentWeather = weather
                    print(weather)
                case .failure(let error):
                    self.errorMessage = "Failed to fetch weather: \(error.localizedDescription)" 
                    print(error)
                }
            }
        }
    }
    
    func searchLocationCity() {
        apiService.searchLocation(nameLocation: searchCity) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let cities):
                    self.cities = cities
                    self.filterCities()
                case .failure(let error):
                    self.errorMessage = "Failed to search cities: \(error.localizedDescription)" // Provide feedback to the user
                    print(error)
                }
            }
        }
    }
    
    func filterCities() {
        var seenNames = Set<String>()
        filteredCities = cities.filter { location in
            guard !seenNames.contains(location.name) else { return false }
            seenNames.insert(location.name)
            return true
        }
    }
}


