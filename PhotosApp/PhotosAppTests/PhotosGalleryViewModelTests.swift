//
//  PhotosGalleryViewModelTests.swift
//  PhotosAppTests
//
//  Created by Boris Filipovic on 07/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import XCTest
@testable import PhotosApp

class PhotosGalleryViewModelTests: XCTestCase {
    
    // MARK: - Test properties.
    
    private let photo = PhotoItem(albumId: 1, id: 1, title: "PhotoTitle", url: "https://testlUrl.com", thumbnailUrl: "https://testThumbnailUrl.com")
    private let albumItem = AlbumItem(userId: 1, id: 1, title: "Title1")
    private let user = UserItem(id: 1, name: "User1", email: "emailUser1@gmail", phone: "1111")
    
    func testInit() {
        /// Setup.
        let viewModel = PhotosGalleryViewModel(photos: [], album: albumItem, user: user)
        
        /// Tests.
        XCTAssertNotNil(viewModel.photos, "Error: Value is not nil.")
        XCTAssertNotNil(viewModel.album, "Error: Value is not nil.")
        XCTAssertNotNil(viewModel.user, "Error: Value is not nil.")
        
        XCTAssertEqual(albumItem.userId, viewModel.album.userId, "Error: Value is not the same.")
        XCTAssertEqual(albumItem.id, viewModel.album.id, "Error: Value is not the same.")
        XCTAssertEqual(albumItem.title, viewModel.album.title, "Error: Value is not the same.")
        XCTAssertNotEqual(0, viewModel.album.userId, "Error: Value should not the same.")
        XCTAssertNotEqual(0, viewModel.album.id, "Error: Value should not the same.")
        XCTAssertNotEqual("", viewModel.album.title, "Error: Value should not the same.")
        XCTAssertEqual(user.id, viewModel.user.id, "Error: Value is not the same.")
        XCTAssertEqual(user.name, viewModel.user.name, "Error: Value is not the same.")
        XCTAssertEqual(user.email, viewModel.user.email, "Error: Value is not the same.")
        XCTAssertEqual(user.phone, viewModel.user.phone, "Error: Value is not the same.")
        XCTAssertEqual(0, viewModel.photos.count, "Error: Value is not the same.")
        XCTAssertNotEqual(-1, viewModel.photos.count, "Error: Value should not the same.")
        XCTAssertNotEqual(1, viewModel.photos.count, "Error: Value should not the same.")
        XCTAssertNotEqual(0, viewModel.user.id, "Error: Value should not the same.")
        XCTAssertNotEqual("", viewModel.user.name, "Error: Value should not the same.")
        XCTAssertNotEqual("", viewModel.user.email, "Error: Value should not the same.")
        XCTAssertNotEqual("", viewModel.user.phone, "Error: Value should not the same.")
    }
}
