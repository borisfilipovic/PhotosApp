//
//  UsersViewController.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 02/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import UIKit

final class UsersViewController: UIViewController {
    
    // MARK: - Properties.
    
    private lazy var usersView: UsersView = {
        let usersV = UsersView()
        usersV.delegate = self
        return usersV
    }()
    
    private lazy var userController = {
        return UsersController()
    }()
    
    // MARK: - Lifecycle.
    
    override func loadView() {
        view = usersView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        setup()
    }
    
    deinit {
        print("UsersViewController deinit called.")
    }
    
    // MARK: - Setup.
    
    private func setup() {
        userController.start()
        navigationItem.title = Translations.usersTitle.rawValue.localizedUppercase
    }
    
    // MARK: - Binding.
    
    private func bindData() {
        /// Data is loading state tracking.
        userController.viewModel.isLoading.valueChanged = { [weak self] isLoading in
            guard let isLoading = isLoading else {return}
            DispatchQueue.main.async {
                self?.usersView.data(isLoading: isLoading)
            }
        }
        
        /// Hide/show table view state tracking.
        userController.viewModel.isTableViewHidden.valueChanged = { [weak self] isTableViewHidden in
            guard let isTableViewHidden = isTableViewHidden else {return}
            DispatchQueue.main.async {
                self?.usersView.tableView(isHidden: isTableViewHidden)
            }
        }
        
        /// Populate table view.
        userController.viewModel.users.valueChanged = { [weak self] users in
            guard let users: [UserItem] = users as? [UserItem] else {return}
            DispatchQueue.main.async {
                self?.usersView.set(users: users)
            }
        }
    }
}

extension UsersViewController: TouchSelectionDelegate {
    func userSelected(data: ViewModelItemProtocol) {
        guard let user = data as? UserItem else {return}
        // TODO: - Move to albums VC.
    }
}
