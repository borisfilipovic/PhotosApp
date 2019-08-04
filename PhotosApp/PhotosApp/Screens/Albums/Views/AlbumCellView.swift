//
//  AlbumCellView.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 04/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import UIKit
import Kingfisher

final class AlbumCellView: UIView {
    
    // MARK: - Properties.
    
    private let albumTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .natural
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        lbl.textColor = .black
        lbl.isOpaque = false
        lbl.lineBreakMode = .byTruncatingTail
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return lbl
    }()
    
    private lazy var thumbnailImageView: UIImageView = {
        let imgView: UIImageView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 10
        return imgView
    }()
    
    private let bottomBorder = CALayer()
    private let sideMargin: CGFloat = 20
    private let topBottomMargin: CGFloat = 10
    
    // MARK: - Init.
    
    init() {
        super.init(frame: CGRect.zero)
        setup()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        bottomBorder.frame = CGRect(
            x: sideMargin,
            y: frame.size.height - 1.0,
            width: frame.size.width - 2 * sideMargin,
            height: 1.0
        )
    }
    
    // MARK: - Setup.
    
    private func setup() {
        addSubview(albumTitleLabel)
        addSubview(thumbnailImageView)
        layer.addSublayer(bottomBorder)
        bottomBorder.backgroundColor = UIColor.lightGray.cgColor
    }
    
    // MARK: - Setup constrains.
    
    private func setupConstraints() {
        /// Album title label.
        albumTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: topBottomMargin).isActive = true
        albumTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -topBottomMargin).isActive = true
        albumTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sideMargin).isActive = true
        albumTitleLabel.trailingAnchor.constraint(equalTo: thumbnailImageView.leadingAnchor, constant: -sideMargin).isActive = true
        
        /// Thumbnail image view.
        thumbnailImageView.topAnchor.constraint(equalTo: topAnchor, constant: topBottomMargin).isActive = true
        thumbnailImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -topBottomMargin).isActive = true
        thumbnailImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sideMargin).isActive = true
        thumbnailImageView.widthAnchor.constraint(equalTo: thumbnailImageView.heightAnchor).isActive = true
    }
}

// MARK: - Public methods.
extension AlbumCellView {
    func set(viewModel: RowViewModel) {
        guard let albumCellViewModel = viewModel as? AlbumsCellViewModel else {
            cleanAll()
            return
        }
        albumTitleLabel.text = albumCellViewModel.album?.title ?? ""
        guard let thumbnailUrlString =  albumCellViewModel.thumbnailUrl else {
            thumbnailImageView.image = nil
            return
        }
        let url = URL(string: thumbnailUrlString)
        thumbnailImageView.kf.setImage(with: url)
    }
    
    func cleanAll() {
        albumTitleLabel.text = ""
        thumbnailImageView.image = nil
    }
}
