//
//  RestClient.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 02/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation
import Alamofire

final class RestClient {
}

// MARK: - Public Methods.
extension RestClient: RestClientProtocol {
    func call(endpoint: EndpointProtocol, parameters: RestClient.Params?, result: RestClient.ResponseResult) {
        Alamofire.request(endpoint.url, method: .get, parameters: parameters, encoding: URLEncoding.default).responseData { response in
            guard let data = response.data, response.response?.statusCode == 200 else {
                result?(.failure(.serverFailedResponse))
                return
            }
            result?(.success(data))
            return
        }
    }
}
