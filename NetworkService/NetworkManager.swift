//
//  NetworkManager.swift
//  WeatherReport
//
//  Created by naswakhansa on 01/10/24.
//

import Foundation

protocol NetworkManagerProtocol {
    func request<T: Decodable>(
        url: URL,
        completion: @escaping(Result<T, WeatherError>) -> Void
    )
}


class NetworkManager: NetworkManagerProtocol {
    func request<T>(url: URL, completion: @escaping(Result<T, WeatherError>) -> Void) where T : Decodable {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(.failure(.invalidURL))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
}
