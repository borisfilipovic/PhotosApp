//
//  UsersViewModel.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 03/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

struct UsersViewModel: RowViewModel {
    let isLoading = Observable<Bool>(false)
    let isTableViewHidden = Observable<Bool>(false)
    let usersCellViewModels = Observable<[UserCellViewModel]?>(nil)
}
