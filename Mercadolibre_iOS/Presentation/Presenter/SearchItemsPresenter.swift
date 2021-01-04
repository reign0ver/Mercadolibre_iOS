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
    
    var items: [SearchItem] = []
    weak var view: UIViewController?
    weak var delegate: SearchItemsPresenterDelegate?
    private let searchItemsInteractor: SearchItemsInteractor
    
    let navigationTitle = "Búsqueda"
    
    init(_ searchItemsInteractor: SearchItemsInteractor) {
        self.searchItemsInteractor = searchItemsInteractor
    }
    
    func executeSearch(with text: String) {
        view?.showLoading()
        searchItemsInteractor.execute(params: text) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let response):
                strongSelf.items = response.results
                strongSelf.delegate?.reloadData()
                strongSelf.view?.hideLoading() // TODO
                break
            case .failure(let error):
                print(error) // TODO - handle error
                strongSelf.view?.hideLoading()
                break
            }
        }
    }
    
}
