//
//  CharacterListCellVO.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 09/01/19.
//  Copyright © 2019 Guilherme Paciulli. All rights reserved.
//

import Foundation

struct CharacterListCellVO {
    var title: String?
    var image: URL?
    var isFetching: Bool
    
    init(character: Character?) {
        self.title = character?.name
        self.image = character?.url
        self.isFetching = character == nil
    }
}
