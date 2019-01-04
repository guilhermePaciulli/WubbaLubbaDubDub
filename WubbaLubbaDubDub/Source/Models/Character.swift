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
    let origin: LocationPreview
    let location: LocationPreview
    let image: URL
    let episode: [EpisodePreview]
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
        self.origin =  try container.decode(LocationPreview.self, forKey: .origin)
        self.location =  try container.decode(LocationPreview.self, forKey: .location)
        self.image =  URL(string: try container.decode(String.self, forKey: .image))!
        self.episode = (try container.decode([String].self, forKey: .episode)).map({ EpisodePreview(url: URL(string: $0)!) })
        self.url = URL(string: try container.decode(String.self, forKey: .url))!
        self.created = DateFormatter.standarizedDateFormatter.date(from: try container.decode(String.self, forKey: .created))!
    }
    
}

enum Gender: String, Codable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "unknown"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
