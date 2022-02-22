//
//  GameView.swift
//  GameStream
//
//  Created by Francisco Vazquez on 18/02/22.
//

import SwiftUI
import AVKit

struct GameView: View {
    var url : String
    var title : String
    var studio : String
    var contentRating : String
    var publicationYear : String
    var description : String
    var tags:[String]
    var imgsUrl:[String]
    
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
