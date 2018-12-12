//
//  FetchRequest.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 10/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class FetchResponse<Results: Decodable>: Decodable {
    
    let info: FetchResponseInfo
    let results: Results
    
}

class FetchResponseInfo: Decodable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String
}
