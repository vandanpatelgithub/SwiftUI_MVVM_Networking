//
//  ContentView.swift
//  SwiftUI_MVVM_Networking
//
//  Created by Vandan Patel on 1/29/21.
//

import SwiftUI
import Combine

struct HomeView: View {
    @ObservedObject var viewModel: HomePageViewModel
    
    init(viewModel: HomePageViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.tracks) { track in
                VStack(alignment: .leading, spacing: 10.0, content: {
                    TrackCell(homeViewModel: viewModel, track: track)
                })
            }
            .listStyle(SidebarListStyle())
            .padding(2)
            .onAppear(perform: {
                if viewModel.tracks.isEmpty {
                    viewModel.fetchTracks()
                }
            })
            .navigationTitle("Katy Perry Songs")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomePageViewModel(serviceManager: ServiceManager()))
    }
}
