//
//  ResponseType.swift
//  PhotosApp
//
//  Created by Boris Filipovic ENGL on 07/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

enum ResponseType {
    case idle
    case requestStarted
    case requestEnded
    case success
    case error(message: String)
}
