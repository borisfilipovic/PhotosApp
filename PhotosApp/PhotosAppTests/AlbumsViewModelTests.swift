//
//  AlbumsViewModelTests.swift
//  PhotosAppTests
//
//  Created by Boris Filipovic ENGL on 07/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import XCTest
@testable import PhotosApp

class AlbumsViewModelTests: XCTestCase {
    
    func testViewModelEmptySetup() {
        /// Setup.
        let viewModel = AlbumsViewModel()
        
        /// Tests.
        XCTAssertEqual(false, viewModel.isLoading.value, "Error: Setting is not the same.")
        XCTAssertEqual(false, viewModel.isTableViewHidden.value, "Error: Setting is not the same.")
        XCTAssertNil((viewModel.albumsCellViewModels.value)??.count, "Error: Value is not nil.")
    }
    
    func testViewModelFalsePropertiesSetup() {
        /// Setup.
        let viewModel = AlbumsViewModel()
        viewModel.isLoading.value = false
        viewModel.isTableViewHidden.value = false
        
        /// Tests.
        XCTAssertEqual(false, viewModel.isLoading.value, "Error: Setting is not the same.")
        XCTAssertEqual(false, viewModel.isTableViewHidden.value, "Error: Setting is not the same.")
        XCTAssertNotEqual(true, viewModel.isLoading.value, "Error: Value should not the same.")
        XCTAssertNotEqual(true, viewModel.isTableViewHidden.value, "Error: Value should not the same.")
    }
    
    func testViewModelTruePropertiesDataSetup() {
        /// Setup.
        let viewModel = AlbumsViewModel()
        viewModel.isLoading.value = true
        viewModel.isTableViewHidden.value = true
        
        /// Tests.
        XCTAssertEqual(true, viewModel.isLoading.value, "Error: Setting is not the same.")
        XCTAssertEqual(true, viewModel.isTableViewHidden.value, "Error: Setting is not the same.")
        XCTAssertNotEqual(false, viewModel.isLoading.value, "Error: Value should not the same.")
        XCTAssertNotEqual(false, viewModel.isTableViewHidden.value, "Error: Value should not the same.")
    }
    
    func testViewModelAlbumsCellViewModels() {
        /// Setup.
        let viewModel = AlbumsViewModel()
        
        /// Step 1.
        viewModel.albumsCellViewModels.value = []
        
        /// Tests.
        XCTAssertEqual(0, (viewModel.albumsCellViewModels.value)??.count, "Error: Setting is not the same.")
        XCTAssertNotEqual(-1, (viewModel.albumsCellViewModels.value)??.count, "Error: Value should not the same.")
        XCTAssertNotEqual(1, (viewModel.albumsCellViewModels.value)??.count, "Error: Value should not the same.")
        
        /// Step 2.
        viewModel.albumsCellViewModels.value = [AlbumsCellViewModel(album: nil, photos: nil, thumbnailUrl: nil)]
        
        /// Tests.
        XCTAssertEqual(1, (viewModel.albumsCellViewModels.value)??.count, "Error: Setting is not the same.")
        XCTAssertNotEqual(0, (viewModel.albumsCellViewModels.value)??.count, "Error: Value should not the same.")
        XCTAssertNotEqual(2, (viewModel.albumsCellViewModels.value)??.count, "Error: Value should not the same.")
        
        /// Step 3.
        viewModel.albumsCellViewModels.value = [AlbumsCellViewModel(album: nil, photos: nil, thumbnailUrl: nil), AlbumsCellViewModel(album: nil, photos: nil, thumbnailUrl: nil), AlbumsCellViewModel(album: nil, photos: nil, thumbnailUrl: nil)]
        
        /// Tests.
        XCTAssertEqual(3, (viewModel.albumsCellViewModels.value)??.count, "Error: Setting is not the same.")
        XCTAssertNotEqual(2, (viewModel.albumsCellViewModels.value)??.count, "Error: Value should not the same.")
        XCTAssertNotEqual(4, (viewModel.albumsCellViewModels.value)??.count, "Error: Value should not the same.")
    }
}
