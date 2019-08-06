//
//  PhotoFooterView.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 06/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import UIKit

final class PhotoFooterView: UIView {
    
    // MARK: - Properties.
    
    private let stackView: UIStackView = {
        let v = UIStackView()
        v.axis = .vertical
        v.distribution = .fillEqually
        v.alignment = .fill
        v.spacing = 0
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private(set) lazy var imageTitleLabel: UILabel = {
        return createLabel()
    }()
    
    private(set) lazy var albumTitleLabel: UILabel = {
        return createLabel()
    }()
    
    private(set) lazy var authorLabel: UILabel = {
        return createLabel()
    }()

    private let sideMargin: CGFloat = 8
    
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
        addSubview(stackView)
        stackView.addArrangedSubview(imageTitleLabel)
        stackView.addArrangedSubview(albumTitleLabel)
        stackView.addArrangedSubview(authorLabel)
    }
    
    // MARK: - Setup constrains.
    
    private func setupConstraints() {
        stackView.pin(to: self, insets: UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10))
    }
    
    // MARK: - (Helper method) Create label.
    
    func createLabel() -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .natural
        lbl.numberOfLines = 1
        lbl.backgroundColor = .clear
        lbl.textColor = .white
        lbl.isOpaque = false
        lbl.lineBreakMode = .byTruncatingTail
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return lbl
    }
}
