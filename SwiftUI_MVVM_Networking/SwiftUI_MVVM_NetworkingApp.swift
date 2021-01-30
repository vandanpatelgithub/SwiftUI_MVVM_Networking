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
            ContentView(viewModel: HomePageViewModel(serviceManager: ServiceManager()))
        }
    }
}
