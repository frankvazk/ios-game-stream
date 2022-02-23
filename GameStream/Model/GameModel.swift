//
//  GameModel.swift
//  GameStream
//
//  Created by Francisco Vazquez on 03/02/22.
//

import Foundation

struct Games : Codable {
    var games:[Game]
}

struct Game : Codable, Hashable {
    var title:String
    var studio:String
    var contentRaiting:String
    var publicationYear:String
    var description:String
    var platforms:[String]
    var tags:[String]
    var videosUrls: videoUrl
    var galleryImages:[String]
}

struct videoUrl : Codable, Hashable {
    var mobile:String
    var tablet:String
}

struct GameComment : Codable, Hashable {
    var author : String
    var date : String
    var comment : String
}
