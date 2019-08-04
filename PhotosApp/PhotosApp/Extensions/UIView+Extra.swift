//
//  UIView+Extra.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 02/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import UIKit

extension UIView {
    func pin(to view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
    func pinSafe(to view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    func pin(to view: UIView, insets: UIEdgeInsets) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).isActive = true
        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -insets.right).isActive = true
    }
    
    func removeAllConstraints() {
        for c in self.constraints {
            self.removeConstraint(c)
        }
    }
}
