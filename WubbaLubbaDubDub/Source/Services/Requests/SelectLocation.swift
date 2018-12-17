//
//  SelectLocation.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 17/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class SelectLocation: APIRequest {
    
    var path: String {
        return "location"
    }
    
    var type: RequestType {
        return .get
    }
    
    var params: [String : String]?
    
    var ids: [Int]?
    
    typealias Response = [Location]
    
    init(withIDs ids: [Int]) {
        self.ids = ids
    }
    
}
