//
//  PhotosGalleryViewModel.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 06/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

struct PhotosGalleryViewModel: RowViewModel {
    let photos: [PhotoItem]
    let album: AlbumItem
    let user: UserItem
}
