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
    
    func getListOfItems(params: String, completion: @escaping (Result<SearchResponse, NetworkError>) -> Void) {
        remoteDataSource.getSearchedItems(params: params, completion: completion)
    }
}
