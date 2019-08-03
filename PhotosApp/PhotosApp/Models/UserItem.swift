//
//  UserItem.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 02/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

struct UserItem: ViewModelItemProtocol, CodableDelegate {
    let id: Int
    let name: String
    let email: String
    let address: AdressItem
    let phone: String
    let website: String
    let company: CompanyItem
}

struct AdressItem: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: GeoItem
}

struct GeoItem: Codable {
    let lat: String
    let lng: String
}

struct CompanyItem: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}
