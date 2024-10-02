//
//  WeatherService.swift
//  WeatherReport
//
//  Created by naswakhansa on 30/09/24.
//

import Foundation

enum WeatherError: Error {
    case invalidURL
    case noData
    case decodingError
}

class WeatherService {
    private let networkManager: NetworkManagerProtocol
    private let API_KEY:String = "0cb41a0db7bceab9eca8e851b524b61f"
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    
    func searchLocation(
        nameLocation: String,
        completion: @escaping(Result<[LocationModel], WeatherError>) -> Void
    ) {
        let urlString: String = "http://api.openweathermap.org/geo/1.0/direct?q=\(nameLocation)&limit=5&appid=\(API_KEY)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        networkManager.request(url: url) {(result: Result<[LocationModel], WeatherError>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }

    }
    
    func fetchCurrentWeather(
        lon: Double,
        lat: Double,
        completion: @escaping(Result<CurrentWeatherModel, WeatherError>) -> Void
    ) {
        
            let urlString: String = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(API_KEY)"
            
            guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
            }
        
            networkManager.request(url: url) {(result: Result<CurrentWeatherModel, WeatherError>) in
                switch result {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchForecastWeather(
        lon: Double,
        lat: Double,
        completion: @escaping(Result<ForecastWeatherModel, WeatherError>)-> Void
    ) {
        let urlString: String = "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=\(API_KEY)"
        
        guard let url = URL(string: urlString) else {
        completion(.failure(.invalidURL))
        return
        }
        
        networkManager.request(url: url) {(result: Result<ForecastWeatherModel, WeatherError>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
