//
//  SearchItemsInteractor.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import Foundation

final class SearchItemsInteractor: Interactor {

    typealias Response = Result<SearchResponse, NetworkError>
    typealias Params = String
    
    private let searchItemsRepository: SearchItemsRepository
    
    init(_ searchItemsRepository: SearchItemsRepository) {
        self.searchItemsRepository = searchItemsRepository
    }
    
    func execute(params: Params, completion: @escaping (Response) -> Void) {
        let formattedParams = params.replacingOccurrences(of: " ", with: "+")
        searchItemsRepository.getListOfItems(params: formattedParams, completion: completion)
    }
    
}
