//
//  HomeView.swift
//  GameStream
//
//  Created by Francisco Vazquez on 01/02/22.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab : Int = 2
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Pantalla Perfil")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person")
                    Text("Pefil")
                }
                .tag(0)
            
            Text("Pantalla Juegos")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }
                .tag(1)
            
            HomeTabView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }
                .tag(2)
            
            Text("Pantalla Favoritos")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart")                        
                    Text("Favoritos")
                }
                .tag(3)
        }
        .accentColor(.white)
    }
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor(Color("TabBarColor"))
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().isTranslucent = true
        
        print("Iniciado las vistas de Home")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HomeTabView:View {
    var body: some View {
        ZStack {
            Color("Marine").ignoresSafeArea()
            VStack {
                Text("Pantalla Home")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            }
            .padding(.horizontal, 18)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
