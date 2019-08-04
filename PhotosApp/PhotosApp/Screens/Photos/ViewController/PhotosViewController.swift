//
//  PhotosViewController.swift
//  PhotosApp
//
//  Created by Boris Filipovic ENGL on 04/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import UIKit

final class PhotosViewController: UIViewController {
    
    // MARK: - Properties.
    
    private lazy var photosView: PhotosView = {
        let usersV = PhotosView()
        usersV.delegate = self
        return usersV
    }()
    
    let photosController: PhotosController
    
    // MARK: - Lifecycle.
    
    init(viewModel: PhotosViewModel) {
        self.photosController = PhotosController(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = photosView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        setup()
    }
    
    deinit {
        print("PhotosViewController deinit called.")
    }
    
    // MARK: - Setup.
    
    private func setup() {
        photosController.start()
        navigationItem.title = Translations.photosTitle.rawValue.localizedUppercase
    }
    
    // MARK: - Binding.
    
    private func bindData() {
        /// Populate photos view.
        photosController.viewModel.valueChanged = { [weak self] albums in
            print("Some data is present")
            guard let albums: [RowViewModel] = albums as? [RowViewModel] else {return}
            DispatchQueue.main.async {
                //self?.albumsView.set(users: albums)
            }
        }
    }
}

extension PhotosViewController: TouchSelectionDelegate {
    func userSelected(indexPath: IndexPath) {
        print("User selected: \(indexPath)")
//        guard let count = userController.viewModel.usersCellViewModels.value??.count, count > indexPath.row, let user = userController.viewModel.usersCellViewModels.value??[indexPath.row].user else { return }
//        let albumsViewController = AlbumsViewController(user: user)
//        navigationController?.pushViewController(albumsViewController, animated: true)
    }
}
