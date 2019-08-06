//
//  PhotoController.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 05/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

final class PhotoController {
    
    // MARK: - Properties.
    
    let viewModel: Observable<RowViewModel?> = Observable<RowViewModel?>(nil)
    private let photoViewModel: RowViewModel
    
    // MARK: - Init.
    
    init(viewModel: RowViewModel) {
        self.photoViewModel = viewModel
    }
}

// MARK: - Public methods.
extension PhotoController {
    func start() {
        viewModel.value = photoViewModel
    }
}
