//
//  TrackResult.swift
//  SwiftUI_MVVM_Networking
//
//  Created by Vandan Patel on 1/29/21.
//

import Foundation

struct TrackResult: Codable {
    let tracks: [Track]
    
    private enum CodingKeys: String, CodingKey {
        case tracks = "results"
    }
}

struct Track: Codable, Identifiable {
    let id = UUID()
    let trackName: String
    let albumName: String
    
    private enum CodingKeys: String, CodingKey {
        case albumName = "collectionName"
        case trackName
    }
}
