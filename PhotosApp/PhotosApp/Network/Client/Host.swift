//
//  Host.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 02/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

enum Host {
    case development
}

extension Host {
    var baseURL: String {
        switch self {
        case .development:
            return "https://jsonplaceholder.typicode.com"
        }
    }
    
    static var current: Host {
        return .development
    }
}
