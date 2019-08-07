//
//  UserCellViewModelTests.swift
//  PhotosAppTests
//
//  Created by Boris Filipovic on 07/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import XCTest
@testable import PhotosApp

class UserCellViewModelTests: XCTestCase {
    
    // MARK: - Test properties.
    
    private let user = UserItem(id: 1, name: "User1", email: "emailUser1@gmail", phone: "1111")
    
    func testInitWithouthUser() {
        /// Setup.
        let viewModel = UserCellViewModel(user: nil)
        
        /// Tests.
        XCTAssertNil(viewModel.user, "Error: Value is not nil.")
        XCTAssertNil(viewModel.user?.id, "Error: Value is not nil.")
        XCTAssertNil(viewModel.user?.name, "Error: Value is not nil.")
        XCTAssertNil(viewModel.user?.email, "Error: Value is not nil.")
        XCTAssertNil(viewModel.user?.phone, "Error: Value is not nil.")
    }
    
    func testInitWithUser() {
        /// Setup.
        let viewModel = UserCellViewModel(user: user)
        
        /// Tests.
        XCTAssertEqual(user.id, viewModel.user?.id, "Error: Value is not the same.")
        XCTAssertEqual(user.name, viewModel.user?.name, "Error: Value is not the same.")
        XCTAssertEqual(user.email, viewModel.user?.email, "Error: Value is not the same.")
        XCTAssertEqual(user.phone, viewModel.user?.phone, "Error: Value is not the same.")
        
        XCTAssertNotEqual(0, viewModel.user?.id, "Error: Value should not the same.")
        XCTAssertNotEqual("User2", viewModel.user?.name, "Error: Value should not the same.")
        XCTAssertNotEqual("emailUser2@gmail", viewModel.user?.email, "Error: Value should not the same.")
        XCTAssertNotEqual("2222", viewModel.user?.phone, "Error: Value should not the same.")
    }
}
