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

struct Game : Codable {
    var title:String
    var studio:String
    var contentRaiting:String
    var publicationYear:String
    var description:String
    var platforms:[String]
    var tags:[String]
    var videosUrls:VideoUrl
    var galleryImages:[String]
}

struct VideoUrl : Codable {
    var mobile:String
    var tables:String
}
