//
//  PhotoCellView.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 05/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import UIKit
import Kingfisher

final class PhotoCellView: UIView {
    
    // MARK: - Properties.
    
    private lazy var photoImageView: UIImageView = {
        let imgView: UIImageView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let photoTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .natural
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        lbl.textColor = UIColor.white.withAlphaComponent(0.6)
        lbl.isOpaque = false
        lbl.lineBreakMode = .byTruncatingTail
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return lbl
    }()
    
    private let titleBackgroundView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let sideMargin: CGFloat = 4
    
    // MARK: - Init.
    
    init() {
        super.init(frame: CGRect.zero)
        setup()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup.
    
    private func setup() {
        addSubview(photoImageView)
        addSubview(titleBackgroundView)
        addSubview(photoTitleLabel)
    }
    
    // MARK: - Setup constrains.
    
    private func setupConstraints() {
        /// Thumbnail photo.
        photoImageView.pin(to: self)

        /// Title label.
        photoTitleLabel.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, constant: 0.5).isActive = true
        photoTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        photoTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sideMargin).isActive = true
        photoTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sideMargin).isActive = true
        
        /// Title background.
        titleBackgroundView.topAnchor.constraint(equalTo: photoTitleLabel.topAnchor).isActive = true
        titleBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

// MARK: - Public methods.
extension PhotoCellView {
    func set(viewModel: RowViewModel) {
        guard let photo = viewModel as? PhotoItem else {
            cleanAll()
            return
        }
        let url = URL(string: photo.thumbnailUrl)
        photoImageView.kf.setImage(with: url)
        photoTitleLabel.text = photo.title.uppercased()
    }
    
    func cleanAll() {
        photoImageView.image = nil
        photoTitleLabel.text = ""
    }
}
