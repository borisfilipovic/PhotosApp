//
//  UICollectionView+Extra.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 05/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import UIKit

extension UICollectionReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionView {
    func register(cell: UICollectionViewCell.Type) {
        self.register(cell, forCellWithReuseIdentifier: cell.identifier)
    }
    
    func register(nib: UICollectionViewCell.Type) {
        self.register(UINib(nibName: nib.identifier, bundle: nil), forCellWithReuseIdentifier: nib.identifier)
    }
    
    func register(header: UICollectionReusableView.Type) {
        self.register(header, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header.identifier)
    }
    
    func register(footer: UICollectionReusableView.Type) {
        self.register(footer, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footer.identifier)
    }
    
    func reuseCell<C: UICollectionViewCell>(_ cell: C.Type, for indexPath: IndexPath) -> C? {
        if let cell = self.dequeueReusableCell(withReuseIdentifier: cell.identifier, for: indexPath) as? C {
            return cell
        }
        return nil
    }
    
    func reuseSectionHeader<H: UICollectionReusableView>(_ header: H.Type, for indexPath: IndexPath) -> H? {
        if let header = self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header.identifier, for: indexPath)  as? H {
            return header
        }
        return nil
    }
    
    func reuseSectionFooter<F: UICollectionReusableView>(_ footer: F.Type, for indexPath: IndexPath) -> F? {
        if let footer = self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footer.identifier, for: indexPath)  as? F {
            return footer
        }
        return nil
    }
}
