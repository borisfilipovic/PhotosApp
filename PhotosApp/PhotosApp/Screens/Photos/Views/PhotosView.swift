//
//  PhotosView.swift
//  PhotosApp
//
//  Created by Boris Filipovic ENGL on 04/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import UIKit

final class PhotosView: UIView {
    
    // MARK: - Properties.
    
    private let mainCollectionView: UICollectionView = {
        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.itemSize = CGSize(width: 10, height: 10)
        collectionFlowLayout.scrollDirection = .vertical
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionFlowLayout)
        collection.backgroundColor = .yellow
        return collection
    }()
    
    weak var delegate: TouchSelectionDelegate?
    
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
        backgroundColor = .white
        backgroundColor = .red
        
        /// Add subviews.
        addSubview(mainCollectionView)
    }
    
    // MARK: - Setup constrains.
    
    private func setupConstraints() {
        mainCollectionView.pinSafe(to: self)
    }
}
