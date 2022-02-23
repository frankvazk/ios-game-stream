//
//  GamesView.swift
//  GameStream
//
//  Created by Francisco Vazquez on 03/02/22.
//

import SwiftUI

struct GamesView: View {
    @ObservedObject var videoGames = GamesViewModel()

    var body: some View {
        VStack{
            Text("Hola desde la pantalla HomeView!")
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            print("Primer elemento del JSON: \(videoGames.gamesInfo[0])")
            print("Título del primer videojuego del JSON: \(videoGames.gamesInfo[0].title)")
        }
                    
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
