//
//  Endpoint.swift
//  SwiftUI_MVVM_Networking
//
//  Created by Vandan Patel on 1/29/21.
//

import Foundation

enum RequestType: String {
    case get = "GET"
    case post = "POST"
}

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var requestType: RequestType { get }
    
    
    var buildRequest: URLRequest? { get }
}

enum AppleAPI {
    case fetchTracks(artistName: String)
}

extension AppleAPI: Endpoint {
    var baseURL: String {
        switch self {
        case .fetchTracks:
            return "https://itunes.apple.com/"
        }
    }
    
    var path: String {
        switch self {
        case .fetchTracks:
            return "search"
        }
    }
    
    var requestType: RequestType {
        switch self {
        case .fetchTracks:
            return .get
        }
    }
    
    var buildRequest: URLRequest? {
        switch self {
        case let .fetchTracks(artistName):
            guard var urlComps = URLComponents(string: baseURL + path) else { return nil }
            urlComps.queryItems = [
                URLQueryItem(name: "term", value: artistName),
                URLQueryItem(name: "entity", value: "song")
            ]
            guard let url = urlComps.url else { return nil }
            var request = URLRequest(url: url)
            request.httpMethod = requestType.rawValue
            return request
        }
    }
}
