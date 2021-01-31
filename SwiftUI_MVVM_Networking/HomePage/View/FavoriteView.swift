//
//  FavoriteView.swift
//  SwiftUI_MVVM_Networking
//
//  Created by Vandan Patel on 1/30/21.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var viewModel: HomePageViewModel
    
    init(viewModel: HomePageViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.favoriteTracks) { track in
                VStack(alignment: .leading, spacing: 10.0, content: {
                    FavoriteCell(track: track)
                })
            }
            .listStyle(SidebarListStyle())
            .padding(2)
            .navigationTitle("Favorites")
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView(viewModel: HomePageViewModel())
    }
}
