//
//  Character.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 10/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class Character: Codable {
    let id: Int
    let name: String
    let status: Status
    let species: String
    let type: String
    let gender: Gender
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
//    init(id: Int, name: String, status: Status, species: String, type: String, gender: Gender, origin: Location, location: Location, image: String, episode: [String], url: String, created: String) {
//        self.id = id
//        self.name = name
//        self.status = status
//        self.species = species
//        self.type = type
//        self.gender = gender
//        self.origin = origin
//        self.location = location
//        self.image = image
//        self.episode = episode
//        self.url = url
//        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-ddTHH:mm:ss.SSSZ"
//        self.created = dateFormatter.date(from: created)!
//    }
}

enum Gender: String, Codable {
    case male = "Male"
    case female = "Female"
    case unknown = "unknown"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
