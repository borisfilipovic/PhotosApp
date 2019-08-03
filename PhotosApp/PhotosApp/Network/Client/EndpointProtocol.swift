//
//  EndpointProtocol.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 02/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

protocol EndpointProtocol {
    typealias Path = String
    var path: Path { get }
    var url: String { get }
    var httpMethod: String { get }
}

extension EndpointProtocol {
    var url: String {
        return "\(Host.current.baseURL)/\(path)"
    }
    
    var httpMethod: String {
        return "GET"
    }
}

/// Make sure we have string.
extension EndpointProtocol where Self: RawRepresentable, Self.RawValue == String {
    var path: String {
        return rawValue
    }
}
