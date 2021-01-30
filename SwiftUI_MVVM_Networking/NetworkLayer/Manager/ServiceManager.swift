//
//  ServiceManager.swift
//  SwiftUI_MVVM_Networking
//
//  Created by Vandan Patel on 1/29/21.
//

import Foundation

enum NetworkError: Error {
    case buildRequestError
}

protocol ServiceManagerProtocol {
    func fetchTracks(for artistName: String, completion: @escaping (Result<TrackResult, Error>) -> ())
}

struct ServiceManager: ServiceManagerProtocol {
    func fetchTracks(for artistName: String, completion: @escaping (Result<TrackResult, Error>) -> ()) {
        let endpoint = AppleAPI.fetchTracks(artistName: artistName)
        
        guard let request = endpoint.buildRequest else {
            completion(.failure(NetworkError.buildRequestError))
            return
        }
        
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(TrackResult.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
