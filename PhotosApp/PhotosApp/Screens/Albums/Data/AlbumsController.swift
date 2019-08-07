//
//  AlbumsController.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 04/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

final class AlbumsController {
    
    // MARK: - Properties.
    
    let viewModel: AlbumsViewModel
    let response = Observable<ResponseType>(.idle)
    private let albumsService: AlbumsService
    private let user: UserItem
    
    // MARK: - Init.
    
    init(viewModel: AlbumsViewModel = AlbumsViewModel(), user: UserItem) {
        self.viewModel = viewModel
        self.user = user
        self.albumsService = AlbumsService(user: user)
    }
}

// MARK: - Public methods.
extension AlbumsController {
    func start() {
        /// Set initial states.
        viewModel.isLoading.value = true
        viewModel.isTableViewHidden.value = true
        response.value = .requestStarted
        
        /// Fetch data.
        albumsService.fetchAlbums { [weak self] result in
            /// Handle states.
            self?.viewModel.isLoading.value = false
            self?.viewModel.isTableViewHidden.value = false
            self?.response.value = .requestEnded
            
            /// Handle results.
            switch result {
            case .success(let albumCellViewModel):
                self?.response.value = .success
                self?.viewModel.albumsCellViewModels.value = albumCellViewModel
            case .failure(let error):
                self?.response.value = .error(message: "Error fetching data. Try pull to refresh data.")
                self?.viewModel.albumsCellViewModels.value = nil
                print("Data error: \(error)")
            }
        }
    }
}
