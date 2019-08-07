//
//  PhotoView.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 05/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import UIKit

final class PhotoView: UIView {
    
    // MARK: - Properties.
    
    private let scrollView: UIScrollView = {
        let scrollV = UIScrollView()
        return scrollV
    }()
    
    private lazy var photoImageView: UIImageView = {
        let imgView: UIImageView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private(set) lazy var photoHeaderView: PhotoHeaderView = {
        let photoV = PhotoHeaderView()
        photoV.translatesAutoresizingMaskIntoConstraints = false
        return photoV
    }()
    
    private(set) lazy var photoFooterView: PhotoFooterView = {
        let photoV = PhotoFooterView()
        photoV.translatesAutoresizingMaskIntoConstraints = false
        return photoV
    }()
    
    private var toolbarHidden: Bool = false
    private var tapGestureRecognizer: UITapGestureRecognizer?
    private(set) var swipeGestureRecognizer: UISwipeGestureRecognizer?
    
    // MARK: - Init.
    
    init() {
        super.init(frame: CGRect.zero)
        setup()
        setupConstraints()
        setGestureRecogniser()
        setSwipeGestureRecogniser()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup.
    
    private func setup() {
        /// Colors.
        backgroundColor = .black

        /// Add subviews.
        scrollView.addSubview(photoImageView)
        addSubview(scrollView)
        addSubview(photoHeaderView)
        addSubview(photoFooterView)
    }
    
    // MARK: - Setup constrains.
    
    private func setupConstraints() {
        /// Scroll view.
        scrollView.pinSafe(to: self)
        photoImageView.pinSafe(to: scrollView)
        
        /// Photo header view.
        photoHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        photoHeaderView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        photoHeaderView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        photoHeaderView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        /// Photo footer view.
        photoFooterView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        photoFooterView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        photoFooterView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        photoFooterView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    // MARK: - Setup gesture recognisers.
    
    private func setGestureRecogniser() {
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PhotoView.toggleVisible))
        tapGestureRecognizer?.numberOfTapsRequired = 1
        if let tapGestureRecognizer = tapGestureRecognizer {
            addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    private func setSwipeGestureRecogniser() {
        swipeGestureRecognizer = UISwipeGestureRecognizer()
        swipeGestureRecognizer?.direction = .down
        if let swipeGestureRecognizer = swipeGestureRecognizer {
            addGestureRecognizer(swipeGestureRecognizer)
        }
    }
}

extension PhotoView {
    @objc func toggleVisible() {
        setUIElementsVisibility()
    }
}

extension PhotoView {
    func set(viewModel: PhotoViewModel) {
        photoFooterView.imageTitleLabel.text = "Title: ".localizedUppercase + viewModel.photo.title.localizedLowercase
        photoFooterView.albumTitleLabel.text = "Album: ".localizedUppercase + viewModel.album.title.localizedLowercase
        photoFooterView.authorLabel.text = "Author: ".localizedUppercase + viewModel.user.name.localizedCapitalized
        photoImageView.kf.setImage(with: URL(string: viewModel.photo.url))
    }
}

private extension PhotoView {
    func setUIElementsVisibility() {
        toolbarHidden.toggle()
        let alpha: CGFloat = toolbarHidden ? 0.0 : 1.0
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.photoHeaderView.alpha = alpha
            self?.photoFooterView.alpha = alpha
        }, completion: nil)
    }
}
