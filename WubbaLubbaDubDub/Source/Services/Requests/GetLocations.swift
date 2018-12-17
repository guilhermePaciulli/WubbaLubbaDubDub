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
    
    typealias Response = FetchResponse<[Location]>
    
}
