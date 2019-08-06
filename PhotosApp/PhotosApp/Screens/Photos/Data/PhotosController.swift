//
//  PhotosController.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 04/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

final class PhotosController {
    
    // MARK: - Properties.
    
    let viewModel: Observable<RowViewModel?> = Observable<RowViewModel?>(nil)
    private let photosViewModel: RowViewModel
    
    // MARK: - Init.
    
    init(viewModel: RowViewModel) {
        self.photosViewModel = viewModel
    }
}

// MARK: - Public methods.
extension PhotosController {
    func start() {
        viewModel.value = photosViewModel
    }
}
