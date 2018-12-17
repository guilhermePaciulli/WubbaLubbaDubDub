//
//  Previews.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 17/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

struct LocationPreview: Codable {
    let name: String
    let url: URL
}

struct EpisodePreview: Codable {
    let url: URL
}

struct CharactersPreview: Codable {
    let url: URL
}
