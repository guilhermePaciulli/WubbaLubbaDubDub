//
//  APICliente.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 10/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class APIClient {
    
    static let shared = APIClient()
    
    private let baseEndpointUrl = "https://rickandmortyapi.com/api/"
    
    private let session = URLSession(configuration: .default)
    
    private init() {}
    
    public func send<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<T.Response>) {
        
        self.session.dataTask(with: self.request(for: request)) { (data, response, error) in
            if let data = data {
                
                /*if*/ let expectedResponse = try! JSONDecoder().decode(T.Response.self, from: data) //{
                    completion(.success(expectedResponse))
//                } else if let serverError = try? JSONDecoder().decode(Error.self, from: data) {
//                    completion(.failure(APIError(message: serverError.error.message)))
//                } else {
//                    completion(.failure(APIError(message: "There was an error communicating with the server")))
//                }

            } else if let error = error {
                completion(.failure(APIError(message: error.localizedDescription)))
            } else {
                completion(.failure(APIError(message: "There was an internal server error")))
            }
        }.resume()
    }
    
    private func request<T: APIRequest>(for request: T) -> URLRequest {
        var stringURL = self.baseEndpointUrl + request.path
        
        if let params = request.params {
            for (key, value) in params {
                stringURL.append(contentsOf: "?"+key+"="+value)
            }
        }
        
        guard let url = URL(string: stringURL) else {
            fatalError("Bad request path: " + stringURL)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.type.rawValue
        urlRequest.setValue("no-cache", forHTTPHeaderField: "cache-control")
        
        
        if request.type != .get {
            let jsonData = try? JSONEncoder().encode(request)
            urlRequest.httpBody = jsonData
        }
        
        
        return urlRequest as URLRequest
    }
    
    struct Error: Codable {
        let error: ErrorData
    }
    
    struct ErrorData: Codable {
        let message: String
    }
    
}
