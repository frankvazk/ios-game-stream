//
//  FavoritesView.swift
//  GameStream
//
//  Created by Francisco Vazquez on 22/02/22.
//

import SwiftUI
import AVKit

struct FavoritesView: View {
    @ObservedObject var allVideoGames = GamesViewModel()
    
    var body: some View {
        ZStack{
            Color("Marine")
                .ignoresSafeArea()
            
            VStack{
                Text("Favoritos")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 30, trailing: 0))
                
                ScrollView(showsIndicators: false) {
                    ForEach(self.allVideoGames.gamesInfo, id: \.self) {
                        game in
                        
                        if let videoUrl = URL(string: game.videosUrls.mobile) {
                            VStack(spacing:0){
                                VideoPlayer(player: AVPlayer(url: videoUrl))
                                    .frame(height: 300)
                                Text(game.title)
                                    .padding()
                                    .frame( maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(.white)
                                    .background(Color("BlueGray"))
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 6.0)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
