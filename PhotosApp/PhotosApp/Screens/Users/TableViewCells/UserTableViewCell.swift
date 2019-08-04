//
//  UserTableViewCell.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 02/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import UIKit

final class UserTableViewCell: UITableViewCell, CellConfigurable {

    // MARK: - Properties.
    
    private let userCellView: UserCellView = {
        let usersV = UserCellView()
        return usersV
    }()

    // MARK: - Init.
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        contentView.addSubview(userCellView)
    }
    
    // MARK: - Setup constrains.
    
    private func setupConstraints() {
        userCellView.pin(to: self)
    }
    
    // MARK: - Prepare for reuse.
    
    private func cleanAll() {
        userCellView.cleanAll()
    }
    
    func setup(viewModel: RowViewModel) {
        userCellView.set(viewModel: viewModel)
    }
}
