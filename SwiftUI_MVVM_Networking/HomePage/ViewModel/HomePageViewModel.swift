//
//  HomePageViewModel.swift
//  SwiftUI_MVVM_Networking
//
//  Created by Vandan Patel on 1/30/21.
//

import Foundation

protocol HomePageViewModelProtocol: ObservableObject {
    func fetchTracks()
    
    var tracks: [Track] { get set }
}

class HomePageViewModel: HomePageViewModelProtocol {
    let serviceManager: ServiceManagerProtocol
    @Published var tracks = [Track]()
    
    init(serviceManager: ServiceManagerProtocol) {
        self.serviceManager = serviceManager
    }
    
    func fetchTracks() {
        serviceManager.fetchTracks(for: "Katy Perry") { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case let .success(trackResult):
                DispatchQueue.main.async {
                    self.tracks = trackResult.tracks
                }
            case let .failure(error):
                print("DEBUG: \(error.localizedDescription)")
            }
        }
    }
}
