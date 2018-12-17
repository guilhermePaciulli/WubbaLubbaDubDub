//
//  Episode.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 17/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class Episode: Codable {
    
    let id: Int
    let name: String
    let airDate: Date
    let episode: String
    let characters: [CharacterPreview]
    let url: URL
    let created: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
        case characters
        case url
        case created
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.airDate = DateFormatter.verboseDateFormatter.date(from: try container.decode(String.self, forKey: .airDate))!
        self.episode = try container.decode(String.self, forKey: .episode)
        self.characters = (try container.decode([String].self, forKey: .characters)).map({ CharacterPreview(url: URL(string: $0)!) })
        self.url = URL(string: try container.decode(String.self, forKey: .url))!
        self.created = DateFormatter.standarizedDateFormatter.date(from: try container.decode(String.self, forKey: .created))!
    }
}
