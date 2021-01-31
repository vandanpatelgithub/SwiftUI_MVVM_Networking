//
//  TrackCell.swift
//  SwiftUI_MVVM_Networking
//
//  Created by Vandan Patel on 1/30/21.
//

import SwiftUI

struct TrackCell: View {
    @ObservedObject var homeViewModel: HomePageViewModel
    let track: Track
    
    init(homeViewModel: HomePageViewModel, track: Track) {
        self.homeViewModel = homeViewModel
        self.track = track
    }
    
    var body: some View {
        HStack {
            Image("KatyPerry")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60, alignment: .leading)
                .cornerRadius(5.0)
            
            VStack(alignment: .leading, spacing: 2.0, content: {
                Text(track.trackName)
                    .font(.headline)
                    .padding(2)
                Text(track.albumName)
                    .font(.subheadline)
                    .padding(2)
            })
            
            Spacer()
            
            Button(action: {
                let firstIndex = Int(homeViewModel.tracks.firstIndex {
                    $0.trackName == track.trackName &&
                        $0.albumName == track.albumName
                } ?? 0)
                homeViewModel.tracks[firstIndex].isFavorite.toggle()
            }, label: {
                Image(systemName: track.isFavorite ? "star.square.fill" : "star.square")
            })
        }
    }
}

struct TrackCell_Previews: PreviewProvider {
    static var previews: some View {
        TrackCell(homeViewModel: HomePageViewModel(), track: Track(trackName: "", albumName: ""))
    }
}
