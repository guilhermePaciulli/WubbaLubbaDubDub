//
//  GetCharacters.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 10/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class GetCharacters: APIRequest {
    
    var path: String {
        return "character"
    }
    
    var type: RequestType {
        return .get
    }
    
    var params: [String : String]?
    
    var ids: [Int]?
    
    typealias Response = FetchResponse<[Character]>
    
    init(withName name: String? = nil, status: Status? = nil, species: String? = nil, type: String? = nil, andGender gender: Gender? = nil) {
        self.params = ["name": name ?? "",
                       "status": status?.rawValue ?? "",
                       "species": species ?? "",
                       "type": type ?? "",
                       "gender": gender?.rawValue ?? ""]
    }
    
    init(withIDs ids: [Int]) {
        self.ids = ids
    }
    
}
