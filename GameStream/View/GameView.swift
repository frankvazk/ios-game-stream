//
//  GameView.swift
//  GameStream
//
//  Created by Francisco Vazquez on 18/02/22.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    var url : String
    var title : String
    var studio : String
    var contentRating : String
    var publicationYear : String
    var description : String
    var tags:[String]
    var imgsUrl:[String]
    var comments : [GameComment] = [
        GameComment(author: "Geoff Atto", date: "Hace 7 días", comment: "He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades."),
        GameComment(author: "Alvy Baack", date: "Hace 12 días", comment: "He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.")
    ]
    
    var body: some View {
        ZStack{
            Color("Marine")
                .ignoresSafeArea()
            VStack{
                Video(url: self.url)
                ScrollView(showsIndicators: false){
                    //Información del video
                    VideoInfo(
                        title:self.title, studio:self.studio,
                        contentRating: self.contentRating, publicationYear: self.publicationYear,
                        description: self.description, tags: self.tags
                    )
                    
                    GameGallery(imgsUrl : self.imgsUrl)
                    GameComments(comments: self.comments)
                    SimilarGames()
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

/*
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
*/

struct Video : View {
    var url : String
    var body: some View{
        if let urlVideo = URL(string: self.url) {
            VideoPlayer(player: AVPlayer(url: urlVideo))
                .ignoresSafeArea()
                .frame(height: 200)
        }
    }
}

struct VideoInfo : View {
    var title : String
    var studio : String
    var contentRating : String
    var publicationYear : String
    var description : String
    var tags:[String]
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text(self.title)
                .font(.largeTitle)
                .foregroundColor(.white)
                .fontWeight(.bold)       
                .padding(.leading)
            
            HStack{
                Text(self.studio)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                
                Text(self.contentRating)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                
                Text(self.publicationYear)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
            }
            
            Text(self.description)
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5)
                .padding(.leading)
            
            HStack{
                ForEach(self.tags, id: \.self ) {
                    tag in
                    
                    Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top, 4)
                        .padding(.leading)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}


struct GameGallery : View {
    var imgsUrl : [String]
    let gridShape = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading){
            Text("GALERÍA")
                .font(.title3)
                .foregroundColor(.white)
                .fontWeight(.bold)                
                .padding(.leading)
                .padding(.top)
                .padding(.bottom, 0)
                    
            ScrollView(.horizontal, showsIndicators: false){
                LazyHGrid(rows: self.gridShape, spacing: 8) {
                    ForEach(self.imgsUrl, id:\.self){
                        imgUrl in
                        if let url = URL(string: imgUrl) {
                            //Desplegar imagenes del servidor
                            if #available(iOS 15.0, *) {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 240, height:120)
                                        
                                } placeholder: {
                                    placeHolderImage()
                                }
                            }
                            else{
                                KFImage(url)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            }
                        }
                    }
                }
            }
            .frame(height: 140)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    @ViewBuilder
    func placeHolderImage() -> some View {
        ZStack{
            Rectangle()
                .fill(Color("BlueGray"))
                .frame(width: 240, height:135)
            
            Image(systemName: "photo")
                .resizable()
                .scaledToFill()
                .frame(width: 42.0, height: 42.0)
            
        }
    }
}

struct GameComments : View {
    var comments : [GameComment]
    var body: some View {
        VStack(alignment: .leading) {
            Text("COMENTARIOS")
                .font(.title3)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.leading)
                .padding(.top)
                .padding(.bottom, 0)
            ForEach(self.comments, id:\.self) {
                comment in
                Comment( comment: comment )
            }
        }
        
    }
}

struct Comment : View {
    var comment : GameComment
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8.0)
                .fill(Color("BlueGray"))
                .frame(maxWidth: .infinity)
            VStack(alignment: .leading){
                HStack{
                    Image("profile")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 40, height: 40, alignment: .center)
                        .padding(.leading)
                        .padding(.top)
                    
                    VStack(alignment: .leading) {
                        Text(self.comment.author)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top)
                        
                        Text(self.comment.date)
                            .font(.system(size: 10))
                            .foregroundColor(.white)
                    }
                }
                
                Text(self.comment.comment)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.bottom)
            }
        }
        .padding(.horizontal)
    }
}

struct SimilarGames : View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("JUEGOS SIMILARES")
                .font(.title3)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.leading)
                .padding(.top)
                .padding(.bottom, 0)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                
            }
        }
    }
}
