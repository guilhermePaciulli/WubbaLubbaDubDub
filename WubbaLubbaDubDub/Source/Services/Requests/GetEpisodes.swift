//
//  GetEpisodes.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 17/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class GetEpisodes: APIRequest {
    
    var path: String {
        return "episode"
    }
    
    var type: RequestType {
        return .get
    }
    
    var params: [String : String]?
    
    typealias Response = FetchResponse<[Episode]>
    
}
