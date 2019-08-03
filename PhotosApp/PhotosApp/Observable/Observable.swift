//
//  Observable.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 03/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

final class Observable<ObservedType> {
    
    // MARK: - Properties.
    
    var valueChanged: ((ObservedType?) -> ())?
    
    fileprivate var _value: ObservedType?
    
    // MARK: - Init.
    
    init(_ value: ObservedType) {
        _value = value
    }
}

extension Observable {
    
    // MARK: - (Public) - Change value.
    
    public var value: ObservedType? {
        get {
            return _value
        }
        
        set {
            _value = newValue
            valueChanged?(_value)
        }
    }
    
    // MARK: - (Public) - Observe change in UIView.
    
    func bindingChanged(to newValue: ObservedType) {
        _value = newValue
    }
}
