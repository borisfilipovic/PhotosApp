//
//  RowViewModel.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 03/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

protocol RowViewModel {}

/// Conform this protocol to handles user press action.
protocol ViewModelPressible {
    var cellPressed: (()->Void)? { get set }
}
