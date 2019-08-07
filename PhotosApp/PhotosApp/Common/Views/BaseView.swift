//
//  BaseView.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 07/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import UIKit

class BaseView: UIView {
    
    // MARK: - Properties.
    
    private lazy var errorMessage: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        lbl.textColor = .black
        lbl.isOpaque = false
        lbl.lineBreakMode = .byTruncatingTail
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        lbl.isHidden = true
        return lbl
    }()
    
    // MARK: - Init.
    
    init() {
        super.init(frame: CGRect.zero)
        setupErrorMessage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupErrorMessage() {
        addSubview(errorMessage)
        errorMessage.topAnchor.constraint(equalTo: centerYAnchor, constant: 40).isActive = true
        errorMessage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        errorMessage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        errorMessage.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
}

// MARK: - Public methods.
extension BaseView {
    func set(text: String) {
        errorMessage.isHidden = false
        errorMessage.text = text
    }
    
    func removeText() {
        errorMessage.isHidden = true
        errorMessage.text = ""
    }
}
