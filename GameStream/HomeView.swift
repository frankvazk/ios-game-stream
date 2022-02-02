//
//  HomeView.swift
//  GameStream
//
//  Created by Francisco Vazquez on 01/02/22.
//

import SwiftUI
import AVKit

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
        ZStack(alignment: .top) {
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
                
                ScrollView(showsIndicators: false) {
                    PopularGamesView()
                }
                
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

struct PopularGamesView:View{
    @State var defaultUrl : String = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive : Bool = false
    let urlVideos : [String ] = [
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"
    ]
    
    var body: some View{
        VStack(alignment: .leading) {
            Text("LOS MAS POPULARES")
                .foregroundColor(.white)
                .font(.title3)
            
            ZStack{
                Button(action: {
                    self.defaultUrl = self.urlVideos[0]
                    print("URL \(self.defaultUrl)")
                    self.isPlayerActive = true
                }, label: {
                    VStack(spacing:0) {
                        Image("The Witcher 3")
                            .resizable()
                            .scaledToFit()
                        Text("The Witcher 3")
                            .frame(maxWidth: .infinity, maxHeight:40, alignment: .leading)
                            .background(Color("BlueGray"))
                    }
                })
                
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(width: 42, height: 42, alignment: .center)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical)
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical)
                
        NavigationLink(isActive: self.$isPlayerActive) {
            VideoPlayer(player: AVPlayer(url: URL(string: self.defaultUrl)!))
                .frame(width: 400, height: 300)
        } label: {
            EmptyView()
        }
    }
}
