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
        guard let url: URL = URL(string: endpoint.url) else {
            result?(.failure(NetworkError.incorrectEndpointData))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod
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
