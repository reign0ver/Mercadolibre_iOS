//
//  SearchItemsService.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import Foundation

final class SearchItemsService: BaseNetwork, SearchItemsRemoteDataSource {
    
    func getSearchedItems(completion: @escaping (Result<[SearchItem], NetworkError>) -> Void) {
        let endpoint = NetworkConstants.searchItems + "iPhone+X" // can definitely goes better
        
        sendRequest(endpoint, of: SearchResponse.self) { result in
            switch result {
            case .success(let response):
                completion(.success(response.results))
                break
            case.failure(let error):
                completion(.failure(error))
                break
            }
        }
    }
}
