//
//  AlbumsViewController.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 04/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import UIKit

final class AlbumsViewController: UIViewController {
    
    // MARK: - Properties.
    
    private lazy var albumsView: SelectionView = {
        let usersV = SelectionView()
        usersV.delegate = self
        return usersV
    }()
    
    private lazy var albumsController = {
        return AlbumsController(user: user)
    }()
    
    private let user: UserItem
    
    // MARK: - Lifecycle.
    
    init(user: UserItem) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = albumsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        setup()
    }
    
    deinit {
        print("AlbumsViewController deinit called.")
    }
    
    // MARK: - Setup.
    
    private func setup() {
        albumsController.start()
        navigationItem.title = Translations.albumTitle.rawValue.localizedUppercase
    }
    
    // MARK: - Binding.
    
    private func bindData() {
        /// Data is loading state tracking.
        albumsController.viewModel.isLoading.valueChanged = { [weak self] isLoading in
            guard let isLoading = isLoading else {return}
            DispatchQueue.main.async {
                self?.albumsView.data(isLoading: isLoading)
            }
        }
        
        /// Hide/show table view state tracking.
        albumsController.viewModel.isTableViewHidden.valueChanged = { [weak self] isTableViewHidden in
            guard let isTableViewHidden = isTableViewHidden else {return}
            DispatchQueue.main.async {
                self?.albumsView.tableView(isHidden: isTableViewHidden)
            }
        }
        
        /// Populate table view.
        albumsController.viewModel.albumsCellViewModels.valueChanged = { [weak self] albums in
            guard let albums: [RowViewModel] = albums as? [RowViewModel] else {return}
            DispatchQueue.main.async {
                self?.albumsView.set(users: albums)
            }
        }
    }
}

extension AlbumsViewController: TouchSelectionDelegate {
    func userSelected(indexPath: IndexPath) {
        guard let count = albumsController.viewModel.albumsCellViewModels.value??.count, count > indexPath.row, let photosViewModel = albumsController.viewModel.albumsCellViewModels.value??[indexPath.row].photos, let album = albumsController.viewModel.albumsCellViewModels.value??[indexPath.row].album, let user = albumsController.viewModel.albumsCellViewModels.value??[indexPath.row].user else { return }
        let photosGalleryViewModel = PhotosGalleryViewModel(photos: photosViewModel.photos ?? [], album: album, user: user)
        let photosViewController = PhotosViewController(viewModel: photosGalleryViewModel)
        navigationController?.pushViewController(photosViewController, animated: true)
    }
}
