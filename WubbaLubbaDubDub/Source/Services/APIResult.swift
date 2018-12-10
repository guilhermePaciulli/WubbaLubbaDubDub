//
//  APIResult.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 10/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(APIError)
}

typealias ResultCallback<Value> = (Result<Value>) -> Void
