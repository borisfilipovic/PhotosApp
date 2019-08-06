//
//  PhotosView.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 04/08/2019.
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
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(cell: PhotoCollectionViewCell.self)
        collection.backgroundColor = .clear
        return collection
    }()
    
    private var photosViewModel: PhotosGalleryViewModel? {
        didSet {
            mainCollectionView.reloadData()
        }
    }
    
    private var estimatedWidth: CGFloat = 160
    private var cellMarginSize: CGFloat = 0
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
        
        /// UICollection view data source and delegate.
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        
        /// Setup grid view.
        setupGridViewLayout()
        
        /// Add subviews.
        addSubview(mainCollectionView)
    }
    
    // MARK: - Setup grid view layout.
    
    private func setupGridViewLayout() {
        let flowLayout = mainCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        flowLayout?.minimumInteritemSpacing = 0
        flowLayout?.minimumLineSpacing = 0
    }
    
    // MARK: - Setup constrains.
    
    private func setupConstraints() {
        mainCollectionView.pinSafe(to: self)
    }
}

extension PhotosView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosViewModel?.photos.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.reuseCell(PhotoCollectionViewCell.self, for: indexPath) else { return UICollectionViewCell() }
        if let photo = photo(forIndexPath: indexPath) {
            cell.setup(viewModel: photo)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.userSelected(indexPath: indexPath)
    }
}

extension PhotosView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let witdh: CGFloat = calculateWidth()
        return CGSize(width: witdh, height: witdh)
    }
}

extension PhotosView {
    func set(photosVM: RowViewModel) {
        guard let photosViewModel = photosVM as? PhotosGalleryViewModel else { return }
        self.photosViewModel = photosViewModel
    }
}

private extension PhotosView {
    func photo(forIndexPath indexPath: IndexPath) -> RowViewModel? {
        guard (photosViewModel?.photos.count ?? 0) > indexPath.row else { return nil }
        return photosViewModel?.photos[indexPath.row]
    }
    
    func calculateWidth() -> CGFloat {
        let safeFrameWidth: CGFloat = safeAreaLayoutGuide.layoutFrame.size.width
        let cellCount = floor(safeFrameWidth / estimatedWidth)
        return safeFrameWidth / cellCount
    }
}
