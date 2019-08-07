//
//  AlbumsCellViewModelTests.swift
//  PhotosAppTests
//
//  Created by Boris Filipovic on 07/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import XCTest
@testable import PhotosApp

class AlbumsCellViewModelTests: XCTestCase {
    
    // MARK: - Test properties.
    
    private let albumItem = AlbumItem(userId: 1, id: 1, title: "Title1")
    private let photos = PhotosViewModel(photos: nil)
    private let thumbnailUrl = "https://testThumbnailUrl.com"
    private let user = UserItem(id: 1, name: "User1", email: "emailUser1@gmail", phone: "1111")
    
    func testInitWithNilValues() {
        /// Setup.
        let viewModel = AlbumsCellViewModel(album: nil, photos: nil, user: user, thumbnailUrl: nil)
        
        /// Tests.
        XCTAssertNil(viewModel.album, "Error: Value is not nil.")
        XCTAssertNil(viewModel.photos, "Error: Value is not nil.")
        XCTAssertNotNil(viewModel.user, "Error: Value is not nil.")
        XCTAssertNil(viewModel.thumbnailUrl, "Error: Value is not nil.")
    }
    
    func testInitWithValues() {
        /// Setup.
        let viewModel = AlbumsCellViewModel(album: albumItem, photos: photos, user: user, thumbnailUrl: thumbnailUrl)
        
        /// Tests.
        XCTAssertNotNil(viewModel.album, "Error: Value should not be nil.")
        XCTAssertNotNil(viewModel.photos, "Error: Value should not be nil.")
        XCTAssertNotNil(viewModel.user, "Error: Value should not be nil.")
        XCTAssertNotNil(viewModel.thumbnailUrl, "Error: Value should not be nil.")
        
        XCTAssertEqual(albumItem.userId, viewModel.album?.userId, "Error: Value is not the same.")
        XCTAssertEqual(albumItem.id, viewModel.album?.id, "Error: Value is not the same.")
        XCTAssertEqual(albumItem.title, viewModel.album?.title, "Error: Value is not the same.")
        XCTAssertNotEqual(0, viewModel.album?.userId, "Error: Value should not the same.")
        XCTAssertNotEqual(0, viewModel.album?.id, "Error: Value should not the same.")
        XCTAssertNotEqual("Title2", viewModel.album?.title, "Error: Value should not the same.")
        XCTAssertNil(viewModel.photos?.photos, "Error: Value is not nil.")
        XCTAssertNil(viewModel.photos?.photos?.count, "Error: Value is not nil.")
        XCTAssertEqual(user.id, viewModel.user.id, "Error: Value is not the same.")
        XCTAssertEqual(user.name, viewModel.user.name, "Error: Value is not the same.")
        XCTAssertEqual(user.email, viewModel.user.email, "Error: Value is not the same.")
        XCTAssertEqual(user.phone, viewModel.user.phone, "Error: Value is not the same.")
        XCTAssertNotEqual(0, viewModel.user.id, "Error: Value should not the same.")
        XCTAssertNotEqual("user1", viewModel.user.name, "Error: Value should not the same.")
        XCTAssertNotEqual("emailUser1", viewModel.user.email, "Error: Value should not the same.")
        XCTAssertNotEqual("11111", viewModel.user.phone, "Error: Value should not the same.")        
        XCTAssertEqual(thumbnailUrl, viewModel.thumbnailUrl, "Error: Value is not the same.")
        XCTAssertNotEqual("Https://testThumbnailUrl.com", viewModel.thumbnailUrl, "Error: Value is not the same.")
    }
}
