//
//  PhotoHeaderView.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 06/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import UIKit

final class PhotoHeaderView: UIView {
    
    // MARK: - Properties.
    
    private(set) lazy var closeButton: UIButton = {
        let btn: UIButton = UIButton()
        btn.setTitle("Close".localizedUppercase, for: UIControl.State())
        btn.setTitleColor(UIColor.white, for: UIControl.State())
        btn.contentHorizontalAlignment = .left
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let sideMargin: CGFloat = 10
    
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
        /// Colors.
        backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        /// Add subviews.
        addSubview(closeButton)
    }
    
    // MARK: - Setup constrains.
    
    private func setupConstraints() {
        /// Close button.
        closeButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sideMargin).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        closeButton.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
}
