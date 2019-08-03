//
//  NetworkError.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 02/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case incorrectEndpointData
    case keyMissingFromResponse
    case serverFailedResponse
    case jsonEncode
    case jsonDecode(Error)
    case generic(Error)
    case message(String?)
}
