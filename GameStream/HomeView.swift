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
    let urlVideos : [String] = [
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"
    ]
    var body: some View {
        ZStack{
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
                            .foregroundColor(.white)
                    }
                }
                .padding([.top, .leading, .bottom, .trailing], 11.0)
                .background(Color("BlueGray"))
                .clipShape(Capsule())
                
                ScrollView(showsIndicators: false){
                    PopularGameView(self.urlVideos[0])
                    SuggestedCategoriesView()
                    RecommendedGamesView([self.urlVideos[1], self.urlVideos[2], self.urlVideos[3]])
                    SuggestedGamesView([self.urlVideos[4], self.urlVideos[5], self.urlVideos[6]])
                    
                }
            }
            .padding(.horizontal, 18.0)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func SearchVideos(){
        print("Estamos buscando videos que coincidan con \(self.searchValue)")
    }
}

struct PopularGameView:View{
    var defaultUrl : String = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    var urlVideo : String = "";
    @State var isPlayerActive : Bool = false
    var body: some View{
        VStack(alignment: .leading) {
            Text("LOS MAS POPULARES")
                .foregroundColor(.white)
                .font(.title3)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            ZStack{
                Button(action: {
                    print("URL \(self.urlVideo)")
                    self.isPlayerActive = true
                }, label: {
                    VStack(spacing:0) {
                        Image("The Witcher 3")
                            .resizable()
                            .scaledToFill()
                        Text("The Witcher 3")
                            .padding(.leading)
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
        }.frame(minWidth:0, maxWidth: .infinity, alignment: .center)
            .padding(.vertical)
                
        NavigationLink(isActive: self.$isPlayerActive) {
            if let url = URL(string: self.urlVideo) {
                VideoPlayer(player: AVPlayer(url: url ))
                    .frame(width: 400, height: 300)
            }
        } label: {
            EmptyView()
        }
    }
    
    init(_ urlVideo:String){
        self.urlVideo = urlVideo
        print(self.urlVideo)
    }
}

struct SuggestedCategoriesView:View{
    var body: some View{
        VStack(alignment: .leading) {
            Text("CATEGORÍAS SUGERIDAS PARA TI")
                .foregroundColor(.white)
                .font(.title3)
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    Button {
                        
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8.0)
                                .fill(Color("BlueGray"))
                                .frame(width: 160.0, height: 90.0)
                            
                            Image("FPS")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42.0, height: 42.0)
                            
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8.0)
                                .fill(Color("BlueGray"))
                                .frame(width: 160.0, height: 90.0)
                            
                            Image("RPG")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42.0, height: 42.0)
                            
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8.0)
                                .fill(Color("BlueGray"))
                                .frame(width: 160.0, height: 90.0)
                            
                            Image("OpenWorld")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42.0, height: 42.0)
                            
                        }
                    }

                }
            }

        }.frame(minWidth:0, maxWidth: .infinity, alignment: .center)
            .padding(.vertical)
    }
}

struct RecommendedGamesView:View{
    @State var isPlayerActive : Bool = false
    @State var urlVideo : String = "";
    var recommendedGamesURLs : [String]
    var body: some View{
        VStack(alignment: .leading) {
            Text("RECOMENDADOS PARA TI")
                .foregroundColor(.white)
                .font(.title3)
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    Button {
                        self.urlVideo = self.recommendedGamesURLs[0]
                        self.isPlayerActive = true
                    } label: {
                        Image("Abzu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240.0, height: 135.0)
                    }
                    
                    Button {
                        self.urlVideo = self.recommendedGamesURLs[1]
                        self.isPlayerActive = true
                    } label: {
                        Image("Crash Bandicoot")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240.0, height: 135.0)
                    }
                    
                    Button {
                        self.urlVideo = self.recommendedGamesURLs[2]
                        self.isPlayerActive = true
                    } label: {
                        Image("Cuphead")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240.0, height: 135.0)
                    }

                }
            }

        }.frame(minWidth:0, maxWidth: .infinity, alignment: .center)
            .padding(.vertical)
        
        NavigationLink(isActive: self.$isPlayerActive) {
            if let url = URL(string: self.urlVideo) {
                VideoPlayer(player: AVPlayer(url: url ))
                    .frame(width: 400, height: 300)
            }
        } label: {
            EmptyView()
        }
    }
    
    init(_ recommendedGamesURLs:[String]){
        self.recommendedGamesURLs = recommendedGamesURLs
    }
}

struct SuggestedGamesView:View{
    @State var isPlayerActive : Bool = false
    @State var urlVideo : String = "";
    var suggestedGamesURLs : [String]
    
    var body: some View{
        VStack(alignment: .leading) {
            Text("VIDEOS QUE PODRÍAN GUSTARTE")
                .foregroundColor(.white)
                .font(.title3)
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    Button {
                        self.urlVideo = self.suggestedGamesURLs[0]
                        self.isPlayerActive = true
                    } label: {
                        Image("DEATH STRANDING")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240.0, height: 135.0)
                    }
                    
                    Button {
                        self.urlVideo = self.suggestedGamesURLs[1]
                        self.isPlayerActive = true
                    } label: {
                        Image("Grand Theft Auto V")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240.0, height: 135.0)
                    }
                    
                    Button {
                        self.urlVideo = self.suggestedGamesURLs[2]
                        self.isPlayerActive = true
                    } label: {
                        Image("Hades")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240.0, height: 135.0)
                    }

                }
            }

        }.frame(minWidth:0, maxWidth: .infinity, alignment: .center)
            .padding(.vertical)
        
        NavigationLink(isActive: self.$isPlayerActive) {
            if let url = URL(string: self.urlVideo) {
                VideoPlayer(player: AVPlayer(url: url ))
                    .frame(width: 400, height: 300)
            }
        } label: {
            EmptyView()
        }
    }
    
    
    init(_ suggestedGamesURLs:[String]){
        self.suggestedGamesURLs = suggestedGamesURLs
    }
}


