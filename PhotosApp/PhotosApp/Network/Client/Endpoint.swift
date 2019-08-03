//
//  Endpoint.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 02/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

enum Endpoint: String, EndpointProtocol {
    case users = "users"
    case albums = "albums"
    case photos = "photos"
}
