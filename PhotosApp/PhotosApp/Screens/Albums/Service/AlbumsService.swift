//
//  AlbumsService.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 04/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import Foundation

final class AlbumsService {
    
    // MARK: - Properties.
    
    typealias FunctionResult = ((Result<[AlbumsCellViewModel], NetworkError>) -> Void)?
    private let client: RestClientProtocol
    private let user: UserItem
    
    // MARK: - Init.
    
    init(client: RestClientProtocol = RestClient(), user: UserItem) {
        self.client = client
        self.user = user
    }
}

// MARK: - Public nethods.
extension AlbumsService {
    
    // MARK: - Fetch albums from server.
    
    func fetchAlbums(completion: FunctionResult) {
        client.call(endpoint: Endpoint.albums, parameters: ["userId": "\(user.id)"]) {
            switch $0 {
            case .success(let data):
                guard let userItem: [AlbumItem] = AlbumItem.parseArray(data: data) else {
                    completion?(.failure(NetworkError.jsonEncode))
                    return
                }
                /// Fetch photos.
                self.client.call(endpoint: Endpoint.photos, parameters: nil) {
                    switch $0 {
                    case .success(let photos):
                        guard let photoItems: [PhotoItem] = PhotoItem.parseArray(data: photos) else {
                            completion?(.failure(NetworkError.jsonEncode))
                            return
                        }
                        let filterUserAlbums = userItem.filter {$0.userId == self.user.id}
                        var albumIds = Array(Set(filterUserAlbums.compactMap {$0.id})) /// Get album id's. Remove duplicates by using Set.
                        albumIds.sort {$0 < $1}
                        let allUsersPhotos = photoItems.filter { (item) -> Bool in
                            return albumIds.contains(item.albumId)
                        }
                        var albumCellViewModels: [AlbumsCellViewModel] = []
                        for album in filterUserAlbums {
                            let albumPhotos = allUsersPhotos.filter {$0.albumId == album.id}
                            let thumbnailUrl = albumPhotos.randomElement()?.thumbnailUrl
                            let vm = AlbumsCellViewModel(album: album, photos: PhotosViewModel(photos: albumPhotos), user: self.user, thumbnailUrl: thumbnailUrl)
                            albumCellViewModels.append(vm)
                        }
                        completion?(.success(albumCellViewModels))
                    case .failure(let error):
                        completion?(.failure(NetworkError.generic(error)))
                    }
                }
            case .failure(let err):
                completion?(.failure(NetworkError.generic(err)))
            }
        }
    }
}
