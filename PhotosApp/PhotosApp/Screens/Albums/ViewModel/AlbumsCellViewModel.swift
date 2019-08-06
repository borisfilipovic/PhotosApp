//
//  AlbumsCellViewModel.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 04/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

struct AlbumsCellViewModel: RowViewModel {
    let album: AlbumItem?
    let photos: PhotosViewModel?
    let user: UserItem
    let thumbnailUrl: String?
}
