//
//  RestClientProtocol.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 02/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

protocol RestClientProtocol {
    typealias Params = [String: Any]
    typealias ResponseResult = ((Result<Data, NetworkError>) -> Void)?
    func call(endpoint: EndpointProtocol, parameters: Params?, result: ResponseResult)
}
