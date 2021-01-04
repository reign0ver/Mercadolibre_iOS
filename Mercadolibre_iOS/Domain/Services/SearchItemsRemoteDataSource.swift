//
//  SearchItemsRemoteDataSource.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import Foundation

protocol SearchItemsRemoteDataSource {
    func getSearchedItems(params: String, completion: @escaping (Result<APISearchResponse, NetworkError>) -> Void)
}
