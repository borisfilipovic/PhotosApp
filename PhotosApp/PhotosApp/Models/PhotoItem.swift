//
//  PhotoItem.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 04/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

struct PhotoItem: ViewModelItemProtocol, CodableDelegate {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
