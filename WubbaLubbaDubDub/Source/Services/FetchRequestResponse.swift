//
//  FetchRequest.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 10/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class FetchRequestResponse<Results: Decodable>: Decodable {
    
    let info: FetchRequestResponseInfo
    let results: Results
    
}

class FetchRequestResponseInfo: Decodable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String
}
