//
//  SearchItemsServiceMock.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 4/01/21.
//

import Foundation

final class SearchItemsServiceMock: SearchItemsRemoteDataSource {
    
    func getSearchedItems(params: String, completion: @escaping (Result<APISearchResponse, NetworkError>) -> Void) {
        if params == "Success" {
            completion(.success(TestObjects.searchAPIResponse))
        } else if params == "Failure" {
            completion(.failure(.genericError))
        }
    }
}
