//
//  SelectCharacter.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 17/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class SelectCharacter: APIRequest {
    
    var path: String {
        return "character"
    }
    
    var type: RequestType {
        return .get
    }
    
    var params: [String : String]?
    
    var ids: [Int]?
    
    typealias Response = [Character]
    
    init(withIDs ids: [Int]) {
        self.ids = ids
    }
    
}
