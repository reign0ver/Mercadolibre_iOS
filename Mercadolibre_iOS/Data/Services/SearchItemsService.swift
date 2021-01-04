//
//  SearchItemsService.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import Foundation

final class SearchItemsService: BaseNetwork, SearchItemsRemoteDataSource {
    
    func getSearchedItems(params: String, completion: @escaping (Result<APISearchResponse, NetworkError>) -> Void) {
        let endpoint = NetworkConstants.searchItems + params
        
        sendRequest(endpoint, of: APISearchResponse.self) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
                break
            case.failure(let error):
                completion(.failure(error))
                break
            }
        }
    }
}
