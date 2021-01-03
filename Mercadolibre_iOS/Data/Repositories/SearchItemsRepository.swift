//
//  SearchItemsRepository.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import Foundation

final class SearchItemsRepository {
    
    private let remoteDataSource: SearchItemsRemoteDataSource
    
    init(_ remoteDataSource: SearchItemsRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getListOfItems() {
        remoteDataSource.getSearchedItems { result in
            switch result {
            case .success(let items):
                print(items)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
