//
//  PickCityViewModel.swift
//  WeatherReport
//
//  Created by naswakhansa on 04/10/24.
//

import Foundation

class ViewModel: ObservableObject {
    let apiService: WeatherService
    @Published var todayDate: String = ""
    @Published var searchCity: String = ""
    @Published var cities: [LocationModel] = []
    @Published var filteredCities: [LocationModel] = []
    @Published var currentForecastWeather: ForecastWeatherModel?
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
                case .failure(let error):
                    self.errorMessage = "Failed to fetch weather: \(error.localizedDescription)" 
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
                    self.errorMessage = "Failed to search cities: \(error.localizedDescription)"
                    print(error)
                }
            }
        }
    }
    
    func fetchForecastWeather(lon: Double, lat: Double) {
        apiService.fetchForecastWeather(lon: lon, lat: lat) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weather):
                    self.currentForecastWeather = weather
                case .failure(let error):
                    self.errorMessage = "Failed to search cities: \(error.localizedDescription)"
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
    
    func getTodayDate() {
        let todayDate = Calendar.current.startOfDay(for: Date())
        
        let dateFormatterDay = DateFormatter()
        dateFormatterDay.dateFormat = "EEEE dd/MM"
        
        let dayString = dateFormatterDay.string(from: todayDate)
        
        self.todayDate = dayString
    }
    
    func getFutureDateComponents(daysFromToday: Int) -> (String, String) {
        let futureDate = Calendar.current.date(byAdding: .day, value: daysFromToday, to: Date())!
        
        let dateFormatterDay = DateFormatter()
        dateFormatterDay.dateFormat = "EEE"
        
        let dateFormatterDate = DateFormatter()
        dateFormatterDate.dateFormat = "dd/MM"
        
        let dayString = dateFormatterDay.string(from: futureDate)
        let dateString = dateFormatterDate.string(from: futureDate)
        
        return (dayString, dateString)
    }
}


