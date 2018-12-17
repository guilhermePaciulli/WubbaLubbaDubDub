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
    let episode: [URL]
    let url: URL
    let created: Date
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case type
        case gender
        case origin
        case location
        case image
        case episode
        case url
        case created
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.status = try container.decode(Status.self, forKey: .status)
        self.species = try container.decode(String.self, forKey: .species)
        self.type =  try container.decode(String.self, forKey: .type)
        self.gender =  try container.decode(Gender.self, forKey: .gender)
        self.origin =  try container.decode(Location.self, forKey: .origin)
        self.location =  try container.decode(Location.self, forKey: .location)
        self.image =  try container.decode(String.self, forKey: .image)
        self.episode = (try container.decode([String].self, forKey: .episode)).map({ URL(string: $0)! })
        self.url = URL(string: try container.decode(String.self, forKey: .url))!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        self.created = dateFormatter.date(from: try container.decode(String.self, forKey: .created))!
    }
    
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
