//
//  SearchItemsPresenter.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import Foundation
import UIKit

protocol SearchItemsPresenterDelegate: class {
    func reloadData()
}

final class SearchItemsPresenter {
    
    var items: [ProductItem] = []
    weak var view: UIViewController?
    weak var delegate: SearchItemsPresenterDelegate?
    private let searchItemsInteractor: SearchItemsInteractor
    
    //MARK: View messages
    let navigationTitle = "Búsqueda"
    let searchBarPlaceholder = "Buscar en Mercado Libre"
    
    init(_ searchItemsInteractor: SearchItemsInteractor) {
        self.searchItemsInteractor = searchItemsInteractor
    }
    
    func executeSearch(with text: String) {
        view?.showLoading()
        searchItemsInteractor.execute(params: text) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let response):
                strongSelf.items = strongSelf.mapResponseIntoEntityView(apiItems: response.results)
                strongSelf.delegate?.reloadData()
                strongSelf.view?.hideLoading()
                break
            case .failure(let error):
                print(error) // TODO - handle error
                strongSelf.view?.hideLoading()
                break
            }
        }
    }
    
    private func mapResponseIntoEntityView(apiItems: [APISearchItem]) -> [ProductItem] {
        return apiItems.map { ProductItem(apiItem: $0) }
    }
    
}
