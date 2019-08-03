//
//  UsersService.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 03/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

/// This service is communication interface between app and backend.
final class UsersService {
    
    // MARK: - Properties.
    
    typealias FunctionResult = ((Result<[UserItem], NetworkError>) -> Void)?
    private let client: RestClientProtocol
    
    // MARK: - Init.
    
    init(client: RestClientProtocol = RestClient()) {
        self.client = client
    }
}

// MARK: - Public nethods.
extension UsersService {
    
    // MARK: - Fetch users from server.
    
    func fetchUsers(completion: FunctionResult) {
        client.call(endpoint: Endpoint.users, parameters: nil) {
            switch $0 {
            case .success(let data):
                guard let userItem: [UserItem] = UserItem.parseArray(data: data) else {
                    completion?(.failure(NetworkError.jsonEncode))
                    return
                }
                completion?(.success(userItem))
            case .failure(let err):
                completion?(.failure(NetworkError.generic(err)))
            }
        }
    }
}
