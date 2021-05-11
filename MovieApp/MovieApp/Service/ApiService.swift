//
//  ApiService.swift
//  MovieApp
//
//  Created by Ádám-Krisztián Német on 11.05.2021.
//

import Foundation

class ApiService {

    private var dataTask: URLSessionDataTask?
    
    static let sharedInstance: ApiService = {
        let instance = ApiService()
        return instance
    }()
    
    func getData<T : Decodable>(_ url:URL,completion:@escaping (Result<T, Error>) -> Void) -> Void {

        // Create URL Session - work on the background
        dataTask = URLSession.shared.dataTask(with: url) { [self] (data, response, error) in
            
            // Handle Error
            if let error = error {
                //completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                // Handle Empty Response
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            do {
                // Parse the data
                let jsonData: T = try self.decodeData(from: data)
                // Back to the main thread
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
            
        }
        dataTask?.resume()
    }

    func decodeData<T : Decodable>(from data : Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
        
    }
}
