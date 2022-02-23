//
//  GamesView.swift
//  GameStream
//
//  Created by Francisco Vazquez on 03/02/22.
//

import SwiftUI
import Kingfisher

struct GamesView: View {
    @ObservedObject var videoGames = GamesViewModel()
    @State var gameViewIsActive : Bool = false //Esta bandera servirá para mostrar la vista de Game
    @State var url : String = ""
    @State var title : String = ""
    @State var studio : String = ""
    @State var contentRating : String = ""
    @State var publishedYear : String = ""
    @State var description : String = ""
    @State var tags:[String] = []
    @State var imgsUrl:[String] = []
    
    //Con este comeponente podemos definir una matriz para la presentación de los datos
    //Para este ejemplo la matriz sera de dos columnas por N filas dependiendo el numero de
    //items que se recuperen de la petición al servidorq
    let gridShape = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack{
            Color("Marine").ignoresSafeArea()
            VStack{
                Text("Juegos")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 30, trailing: 0))
                
                ScrollView(showsIndicators: false){
                    LazyVGrid(columns: gridShape, spacing: 8) {
                        ForEach(self.videoGames.gamesInfo, id:\.self){
                            game in
                            Button {
                                self.url = game.videosUrls.mobile
                                self.title = game.title
                                self.studio = game.studio
                                self.contentRating = game.contentRaiting
                                self.description = game.description
                                self.tags = game.tags
                                self.imgsUrl = game.galleryImages
                                print("Pulse el juego \(self.title)")
                            } label: {
                                if let urlImage = URL(string: game.galleryImages[0]) {
                                    if #available(iOS 15.0, *) {
                                        AsyncImage(url: urlImage) { image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 160, height: 90)
                                                .clipShape(RoundedRectangle(cornerRadius: 4))
                                                .padding(.bottom, 12)
                                                
                                        } placeholder: {
                                            placeHolderImage()
                                        }
                                    }
                                    else{
                                        KFImage(urlImage)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .clipShape(RoundedRectangle(cornerRadius: 4))
                                            .padding(.bottom, 12)
                                    }
                                }
                            }
                        }
                    }
                }
            }.padding(.horizontal, 18.0)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            print("Primer elemento del JSON: \(videoGames.gamesInfo[0])")
            print("Título del primer videojuego del JSON: \(videoGames.gamesInfo[0].title)")
        }
                    
    }
    
    @ViewBuilder
    func placeHolderImage() -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8.0)
                .fill(Color("BlueGray"))
                .frame(width: 160.0, height: 90.0)
            
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 42.0, height: 42.0)
            
        }
        .padding(.bottom, 12)
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
