//
//  UserCellView.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 02/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import UIKit

final class UserCellView: UIView {
    
    // MARK: - Properties.
    
    private lazy var userNameLabel: UILabel = {
        let lbl = createLabel()
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    
    private lazy var emailAddressLabel: UILabel = {
        let lbl = createLabel()
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return lbl
    }()
    
    private let bottomBorder = CALayer()
    private let sideMargin: CGFloat = 20
    
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
        addSubview(userNameLabel)
        addSubview(emailAddressLabel)
        layer.addSublayer(bottomBorder)
        bottomBorder.backgroundColor = UIColor.lightGray.cgColor
    }
    
    // MARK: - Setup constrains.
    
    private func setupConstraints() {
        /// User name label.
        userNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sideMargin).isActive = true
        userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sideMargin).isActive = true
        userNameLabel.bottomAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        /// Email address label.
        emailAddressLabel.topAnchor.constraint(equalTo: centerYAnchor).isActive = true
        emailAddressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sideMargin).isActive = true
        emailAddressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sideMargin).isActive = true
        emailAddressLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

// MARK: - Public methods.
extension UserCellView {
    func set(user: UserItem) {
        userNameLabel.text = user.name
        emailAddressLabel.text = user.email + ", " + user.phone
    }
    
    func cleanAll() {
        userNameLabel.text = ""
        emailAddressLabel.text = ""
    }
}

// MARK: - Private(Helper) methods.
private extension UserCellView {
    func createLabel() -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .natural
        lbl.numberOfLines = 1
        lbl.backgroundColor = .clear
        lbl.textColor = .black
        lbl.isOpaque = false
        lbl.lineBreakMode = .byTruncatingTail
        return lbl
    }
}
