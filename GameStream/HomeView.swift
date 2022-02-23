//
//  HomeView.swift
//  GameStream
//
//  Created by Francisco Vazquez on 01/02/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            Text("Pantalla Perfil")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person")
                    Text("Pefil")
                }
            
            Text("Pantalla Juegos")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }
            
            Text("Pantalla Home")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }
            
            Text("Pantalla Favoritos")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart")                        
                    Text("Favoritos")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
