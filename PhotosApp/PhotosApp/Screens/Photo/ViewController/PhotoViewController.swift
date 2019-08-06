//
//  PhotoViewController.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 05/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import UIKit

final class PhotoViewController: UIViewController {
    
    // MARK: - Properties.
    
    private lazy var photoView: PhotoView = {
        let photoV = PhotoView()
        photoV.photoHeaderView.closeButton.addTarget(self, action: #selector(PhotoViewController.close(sender:)), for: .touchUpInside)
        photoV.swipeGestureRecognizer?.addTarget(self, action: #selector(PhotoViewController.close(sender:)))
        return photoV
    }()
    
    let photoController: PhotoController
    
    // MARK: - Lifecycle.
    
    init(viewModel: RowViewModel) {
        self.photoController = PhotoController(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = photoView
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
        photoController.start()
    }
    
    // MARK: - Binding.
    
    private func bindData() {
        photoController.viewModel.valueChanged = { [weak self] photoVM in
            guard let photoVM: PhotoViewModel = photoVM as? PhotoViewModel else {return}
            DispatchQueue.main.async {
                self?.photoView.set(viewModel: photoVM)
            }
        }
    }
}

extension PhotoViewController {
    @objc func close(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
