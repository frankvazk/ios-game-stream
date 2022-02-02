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
    @State var searchValue : String = ""
    var body: some View {
        ZStack {
            Color("Marine").ignoresSafeArea()
            VStack {
                Image("applogo")
                    .resizable()
                    .aspectRatio( contentMode: .fit )
                    .padding(.bottom, 20)
                    .frame(width: 250)
                HStack{
                    Button (
                        action: SearchVideos,
                        label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(searchValue.isEmpty ? .yellow : Color("DarkCian") )
                        }
                    )
                    
                    ZStack(alignment: Alignment.leading ){
                        if searchValue.isEmpty {
                            Text("Buscar un vídeo")
                                .foregroundColor(Color("LightGray"))
                        }
                        
                        TextField("", text: $searchValue)
                    }
                }
                .padding([.top, .leading, .bottom, .trailing], 11)
                .background(Color("BlueGray"))
                .clipShape(Capsule())
                

                
                Text("Pantalla Home")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            }
            .padding(.horizontal, 18)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func SearchVideos(){
        print("Estamos buscando videos que coincidan con \(self.searchValue)")
    }
}
