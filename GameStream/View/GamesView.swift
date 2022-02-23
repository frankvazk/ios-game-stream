//
//  GamesView.swift
//  GameStream
//
//  Created by Francisco Vazquez on 03/02/22.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        Text("Hola desde la pantalla HomeView!")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                print("Primer elemento del JSON")
                print("Título del primer videojuego del JSON")
            }
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
