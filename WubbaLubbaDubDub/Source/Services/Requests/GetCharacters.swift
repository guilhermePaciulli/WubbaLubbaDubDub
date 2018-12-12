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
    
    typealias Response = FetchResponse<[Character]>
    
}
