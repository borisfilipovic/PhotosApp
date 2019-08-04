//
//  AlbumsViewModel.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 04/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

struct AlbumsViewModel {
    let isLoading = Observable<Bool>(false)
    let isTableViewHidden = Observable<Bool>(false)
    let albumsCellViewModels = Observable<[AlbumsCellViewModel]?>(nil)
}
