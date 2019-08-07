//
//  RestClient.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 02/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

final class RestClient {
}

extension RestClient: RestClientProtocol {

    // MARK: - Public Methods.
    
    func call(endpoint: EndpointProtocol, parameters: RestClient.Params?, result: RestClient.ResponseResult) {
        let urlComponents = NSURLComponents(string: endpoint.url)
        var queryItems: [URLQueryItem] = []
        for case let param in parameters ?? [:] {
            let name = param.key
            if let value = param.value as? String {
                queryItems.append(URLQueryItem(name: name, value: value))
            }
        }
//        if !queryItems.isEmpty {
//            urlComponents?.queryItems = queryItems
//        }
        guard let url = urlComponents?.url else {
            result?(.failure(NetworkError.incorrectEndpointData))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod
//        request.timeoutInterval = 10
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data, error == nil, let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode == 200 {
                result?(.success(data))
            } else {
                result?(.failure(.serverFailedResponse))
            }
            return
        }
        task.resume()
    }
}
