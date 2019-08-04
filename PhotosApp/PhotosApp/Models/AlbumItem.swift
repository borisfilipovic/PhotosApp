//
//  AlbumItem.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 04/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

struct AlbumItem: ViewModelItemProtocol, CodableDelegate {
    let userId: Int
    let id: Int
    let title: String
}
