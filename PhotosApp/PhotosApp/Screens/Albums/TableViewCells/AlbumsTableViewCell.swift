//
//  AlbumsTableViewCell.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 04/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import UIKit

final class AlbumsTableViewCell: UITableViewCell, CellConfigurable {
    
    // MARK: - Properties.
    
    private let albumCellView: AlbumCellView = {
        let usersV = AlbumCellView()
        return usersV
    }()
    
    // MARK: - Init.
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setup()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cleanAll()
    }
    
    // MARK: - Setup.
    
    private func setup() {
        contentView.addSubview(albumCellView)
    }
    
    // MARK: - Setup constrains.
    
    private func setupConstraints() {
        albumCellView.pin(to: self)
    }
    
    // MARK: - Prepare for reuse.
    
    private func cleanAll() {
        albumCellView.cleanAll()
    }
    
    func setup(viewModel: RowViewModel) {
        albumCellView.set(viewModel: viewModel)
    }
}
