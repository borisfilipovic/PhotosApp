//
//  UITableView+Extra.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 02/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import UIKit

extension UITableView {
    func register(cell: UITableViewCell.Type) {
        self.register(cell, forCellReuseIdentifier: cell.identifier)
    }
    
    func register(header: UITableViewHeaderFooterView.Type) {
        self.register(header, forHeaderFooterViewReuseIdentifier: header.identifier)
    }
    
    func reuseCell<C: UITableViewCell>(_ cell: C.Type, for indexPath: IndexPath) -> C? {
        if let cell = self.dequeueReusableCell(withIdentifier: cell.identifier, for: indexPath) as? C {
            return cell
        }
        return nil
    }
    
    func reuseSectionHeader<H: UITableViewHeaderFooterView>(_ header: H.Type) -> H? {
        if let header = self.dequeueReusableHeaderFooterView(withIdentifier: header.identifier) as? H {
            return header
        }
        return nil
    }
    
    func hasCell(at indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewHeaderFooterView {
    static var identifier: String {
        return String(describing: self)
    }
}
