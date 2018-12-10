//
//  APIRequest.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 10/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

protocol APIRequest: Encodable {
    associatedtype Response: Decodable
    
    var path: String { get }
    
    var type: RequestType { get }
    
    var params: [String: String]? { get }
}

enum RequestType: String {
    case get = "GET"
    case post = "POST"
}
