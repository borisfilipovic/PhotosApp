//
//  CodableDelegate.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 03/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

protocol CodableDelegate: Codable {
}

extension CodableDelegate {
    static func parse<S: Codable>(data: Data?) -> S? {
        guard let data = data else {
            return nil
        }
        return try? JSONDecoder().decode(S.self, from: data)
    }
    
    static func parseArray<S: Codable>(data: Data?) -> [S]? {
        guard let data = data else {
            return nil
        }
        return try? JSONDecoder().decode([S].self, from: data)
    }    
}
