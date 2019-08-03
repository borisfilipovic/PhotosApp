//
//  UsersController.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 03/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

final class UsersController {
    
    // MARK: - Properties.
    
    let viewModel: UsersViewModel
    private let userService: UsersService
    
    // MARK: - Init.
    
    init(viewModel: UsersViewModel = UsersViewModel(), userService: UsersService = UsersService()) {
        self.viewModel = viewModel
        self.userService = userService
    }
}

// MARK: - Public methods.
extension UsersController {
    func start() {
        /// Set initial states.
        viewModel.isLoading.value = true
        viewModel.isTableViewHidden.value = true
        
        /// Fetch data.
        userService.fetchUsers { [weak self] result in
            /// Handle states.
            self?.viewModel.isLoading.value = false
            self?.viewModel.isTableViewHidden.value = false
            
            /// Handle results.
            switch result {
            case .success(let users):
                self?.viewModel.users.value = users
            case .failure(let error):
                self?.viewModel.users.value = nil
                print("Data error: \(error)")
            }
        }
    }
}
