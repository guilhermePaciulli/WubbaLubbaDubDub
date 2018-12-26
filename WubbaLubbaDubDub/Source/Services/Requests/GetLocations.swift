//
//  GetLocations.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 17/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class GetLocations: APIRequest {
    
    var path: String {
        return "location"
    }
    
    var type: RequestType {
        return .get
    }
    
    var params: [String : String]?
    
    var ids: [Int]?
    
    typealias Response = FetchResponse<[Location]>
    
    init(withName name: String? = nil, withType type: String? = nil, andDimension dimension: String? = nil, atPage page: Int = 1) {
        self.params = ["name": name ?? "",
                       "type": type ?? "",
                       "dimension": type ?? "",
                       "page": String(describing: page)]
    }
    
}
