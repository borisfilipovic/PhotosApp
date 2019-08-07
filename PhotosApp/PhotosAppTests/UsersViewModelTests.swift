//
//  UsersViewModelTests.swift
//  PhotosAppTests
//
//  Created by Boris Filipovic on 07/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import XCTest
@testable import PhotosApp

class UsersViewModelTests: XCTestCase {
    
    // MARK: - Test properties.
    private let user1 = UserItem(id: 1, name: "User1", email: "emailUser1@gmail", phone: "1111")
    private let user2 = UserItem(id: 2, name: "User2", email: "emailUser2@gmail", phone: "2222")
    private let user3 = UserItem(id: 3, name: "User3", email: "emailUser3@gmail", phone: "3333")
    
    func testViewModelEmptySetup() {
        /// Setup.
        let viewModel = UsersViewModel()
  
        /// Tests.
        XCTAssertEqual(false, viewModel.isLoading.value, "Error: Setting is not the same.")
        XCTAssertEqual(false, viewModel.isTableViewHidden.value, "Error: Setting is not the same.")
        XCTAssertNil((viewModel.usersCellViewModels.value)??.count, "Error: Value is not nil.")
    }
    
    func testViewModelFalsePropertiesSetup() {
        /// Setup.
        let viewModel = UsersViewModel()
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
        let viewModel = UsersViewModel()
        viewModel.isLoading.value = true
        viewModel.isTableViewHidden.value = true
        
        /// Tests.
        XCTAssertEqual(true, viewModel.isLoading.value, "Error: Setting is not the same.")
        XCTAssertEqual(true, viewModel.isTableViewHidden.value, "Error: Setting is not the same.")
        XCTAssertNotEqual(false, viewModel.isLoading.value, "Error: Value should not the same.")
        XCTAssertNotEqual(false, viewModel.isTableViewHidden.value, "Error: Value should not the same.")
    }
    
    func testViewModelUsersCellViewModel() {
        /// Setup.
        let viewModel = UsersViewModel()
        
        /// Step 1.
        viewModel.usersCellViewModels.value = []
        
        /// Tests.
        XCTAssertEqual(0, (viewModel.usersCellViewModels.value)??.count, "Error: Setting is not the same.")
        XCTAssertNotEqual(-1, (viewModel.usersCellViewModels.value)??.count, "Error: Value should not the same.")
        XCTAssertNotEqual(1, (viewModel.usersCellViewModels.value)??.count, "Error: Value should not the same.")
        
        /// Step 2.
        viewModel.usersCellViewModels.value = [UserCellViewModel(user: nil)]
        
        /// Tests.
        XCTAssertEqual(1, (viewModel.usersCellViewModels.value)??.count, "Error: Setting is not the same.")
        XCTAssertNotEqual(0, (viewModel.usersCellViewModels.value)??.count, "Error: Value should not the same.")
        XCTAssertNotEqual(2, (viewModel.usersCellViewModels.value)??.count, "Error: Value should not the same.")
        
        /// Step 3.
        viewModel.usersCellViewModels.value = [UserCellViewModel(user: nil), UserCellViewModel(user: nil), UserCellViewModel(user: nil)]
        
        /// Tests.
        XCTAssertEqual(3, (viewModel.usersCellViewModels.value)??.count, "Error: Setting is not the same.")
        XCTAssertNotEqual(0, (viewModel.usersCellViewModels.value)??.count, "Error: Value should not the same.")
        XCTAssertNotEqual(1, (viewModel.usersCellViewModels.value)??.count, "Error: Value should not the same.")
        XCTAssertNotEqual(2, (viewModel.usersCellViewModels.value)??.count, "Error: Value should not the same.")
        XCTAssertNotEqual(4, (viewModel.usersCellViewModels.value)??.count, "Error: Value should not the same.")
    }

    func testViewModelUsersCellVMSetup() {
        /// Setup.
        let viewModel = UsersViewModel()
        viewModel.isLoading.value = true
        viewModel.isTableViewHidden.value = true
        viewModel.usersCellViewModels.value = [UserCellViewModel(user: user1), UserCellViewModel(user: user2), UserCellViewModel(user: user3)]
        
        /// Tests.
        XCTAssertEqual(3, (viewModel.usersCellViewModels.value)??.count, "Error: Setting is not the same.")
        XCTAssertEqual(user1.id, (viewModel.usersCellViewModels.value)??.first?.user?.id, "Error: Value is not the same.")
        XCTAssertEqual(user1.name, (viewModel.usersCellViewModels.value)??.first?.user?.name, "Error: Value is not the same.")
        XCTAssertEqual(user1.email, (viewModel.usersCellViewModels.value)??.first?.user?.email, "Error: Value is not the same.")
        XCTAssertEqual(user1.phone, (viewModel.usersCellViewModels.value)??.first?.user?.phone, "Error: Value is not the same.")
        XCTAssertEqual(user2.id, (viewModel.usersCellViewModels.value)??[1].user?.id, "Error: Value is not the same.")
        XCTAssertEqual(user2.name, (viewModel.usersCellViewModels.value)??[1].user?.name, "Error: Value is not the same.")
        XCTAssertEqual(user2.email, (viewModel.usersCellViewModels.value)??[1].user?.email, "Error: Value is not the same.")
        XCTAssertEqual(user2.phone, (viewModel.usersCellViewModels.value)??[1].user?.phone, "Error: Value is not the same.")
        XCTAssertEqual(user3.id, (viewModel.usersCellViewModels.value)??.last?.user?.id, "Error: Value is not the same.")
        XCTAssertEqual(user3.name, (viewModel.usersCellViewModels.value)??.last?.user?.name, "Error: Value is not the same.")
        XCTAssertEqual(user3.email, (viewModel.usersCellViewModels.value)??.last?.user?.email, "Error: Value is not the same.")
        XCTAssertEqual(user3.phone, (viewModel.usersCellViewModels.value)??.last?.user?.phone, "Error: Value is not the same.")
        
        XCTAssertNotEqual(user1.name, (viewModel.usersCellViewModels.value)??.last?.user?.name, "Error: Value should not the same.")
        XCTAssertNotEqual(user1.phone, (viewModel.usersCellViewModels.value)??.last?.user?.phone, "Error: Value should not the same.")
        XCTAssertNotEqual(user3.id, (viewModel.usersCellViewModels.value)??.first?.user?.id, "Error: Value should not the same.")
    }
}
