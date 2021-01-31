//
//  FavoriteCell.swift
//  SwiftUI_MVVM_Networking
//
//  Created by Vandan Patel on 1/30/21.
//

import SwiftUI

struct FavoriteCell: View {
    let track: Track
    
    init(track: Track) {
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
        }
    }
}

struct FavoriteCell_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCell(track: Track(trackName: "", albumName: ""))
    }
}
