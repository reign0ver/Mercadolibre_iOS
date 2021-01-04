//
//  SearchItemsCoordinator.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import UIKit

final class SearchItemsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let presenter = AppDelegate.shared.diManager.getContainer().resolve(SearchItemsPresenter.self)!
        let vc = SearchItemsViewController(presenter)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showItemDetails() {
        // TODO
    }
    
}
