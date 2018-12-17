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
    let type: String 
    let dimension: String
    let residents: [CharacterPreview]
    let url: URL
    let created: Date
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case dimension
        case residents
        case url
        case created
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(String.self, forKey: .type)
        self.dimension = try container.decode(String.self, forKey: .dimension)
        self.residents = (try container.decode([String].self, forKey: .residents)).map({ CharacterPreview(url: URL(string: $0)!) })
        self.url = URL(string: try container.decode(String.self, forKey: .url))!
        self.created = DateFormatter.standarizedDateFormatter.date(from: try container.decode(String.self, forKey: .created))!
    }
}
