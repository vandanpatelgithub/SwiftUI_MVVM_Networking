//
//  SwiftUI_MVVM_NetworkingApp.swift
//  SwiftUI_MVVM_Networking
//
//  Created by Vandan Patel on 1/29/21.
//

import SwiftUI

@main
struct SwiftUI_MVVM_NetworkingApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                let viewModel = HomePageViewModel(serviceManager: ServiceManager())
                HomeView(viewModel: viewModel)
                    .tabItem {
                        Image(systemName: "homekit")
                        Text("Home")
                    }
                
                FavoriteView(viewModel: viewModel)
                    .tabItem {
                        Image(systemName: "star.square")
                        Text("Favorites")
                    }
            }
            .accentColor(.red)
            
        }
    }
}
