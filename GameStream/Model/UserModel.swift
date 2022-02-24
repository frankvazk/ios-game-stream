//
//  UserModel.swift
//  GameStream
//
//  Created by Francisco Vazquez on 23/02/22.
//

import Foundation

struct User : Codable {
    var username : String?
    var password : String
    var email    : String
}
