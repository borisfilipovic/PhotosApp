//
//  PhotoCollectionViewCell.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 05/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell, CellConfigurable {

    // MARK: - Properties.

    private let photoCellView: PhotoCellView = {
        let photV = PhotoCellView()
        return photV
    }()
    
    // MARK: - Init.
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cleanAll()
    }
    
    // MARK: - Setup.
    
    private func setup() {
        contentView.addSubview(photoCellView)
    }
    
    // MARK: - Setup constrains.
    
    private func setupConstraints() {
        photoCellView.pin(to: self)
    }
    
    // MARK: - Prepare for reuse.
    
    private func cleanAll() {
        photoCellView.cleanAll()
    }
    
    // MARK: - Setup view model.
    
    func setup(viewModel: RowViewModel) {
        photoCellView.set(viewModel: viewModel)
    }
}
