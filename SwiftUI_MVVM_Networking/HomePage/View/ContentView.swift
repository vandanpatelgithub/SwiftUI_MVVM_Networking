//
//  ContentView.swift
//  SwiftUI_MVVM_Networking
//
//  Created by Vandan Patel on 1/29/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel: HomePageViewModel
    
    init(viewModel: HomePageViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.tracks) { track in
                VStack(alignment: .leading, spacing: 10.0, content: {
                    Text(track.trackName)
                        .font(.headline)
                        .padding(2)
                    Text(track.albumName)
                        .font(.subheadline)
                        .padding(2)
                })
            }
            .onAppear(perform: {
                viewModel.fetchTracks()
            })
            .navigationTitle("Katy Perry Songs")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: HomePageViewModel(serviceManager: ServiceManager()))
    }
}
