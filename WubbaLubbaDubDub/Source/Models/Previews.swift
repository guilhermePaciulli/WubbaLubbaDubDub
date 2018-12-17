//
//  Previews.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 17/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class LocationPreview: Codable {
    let name: String
    let url: URL?
    
    enum Codingkeys: String, CodingKey {
        case name
        case url
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.url = URL(string: try container.decode(String.self, forKey: .url))
    }
}

struct EpisodePreview: Codable {
    let url: URL
}

struct CharacterPreview: Codable {
    let url: URL
}
