//
//  PaginationController.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 17/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class CharactersDAO {
    
    static let shared = CharactersDAO()
    
    private init() {}
    
    func fetch(withName name: String? = nil, status: Status? = nil, species: String? = nil, type: String? = nil, andGender gender: Gender? = nil, atPage page: Int = 1, completion: @escaping ResultCallback<GetCharacters.Response>) {
        APIClient.shared.send(GetCharacters(withName: name, status: status, species: species, type: type, andGender: gender, atPage: page), completion: completion)
    }
    
    func fetch(byID characters: [Character], completion: @escaping ResultCallback<SelectCharacter.Response>) {
        APIClient.shared.send(SelectCharacter(withIDs: characters.map({ $0.id })), completion: completion)
    }
    
    
}
