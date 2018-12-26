//
//  PaginationController.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 17/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class CharactersDAO {
    
    let shared = CharactersDAO()
    
    private init() {}
    
    func fetch(atPage page: Int, completion: @escaping ResultCallback<GetCharacters.Response>) {
        APIClient.shared.send(GetCharacters(atPage: page), completion: completion)
    }
    
    func fetch(byID characters: [Character], completion: @escaping ResultCallback<SelectCharacter.Response>) {
        APIClient.shared.send(SelectCharacter(withIDs: characters.map({ $0.id })), completion: completion)
    }
    
    
}
