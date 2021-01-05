//
//  SearchItemsCoordinator.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import UIKit

protocol SearchItemsFlow: class {
    func coordinateToItemDetails(item: ProductItem)
}

final class SearchItemsCoordinator: Coordinator, SearchItemsFlow {
    
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let vc = AppDelegate.shared.diManager.getContainer().resolve(SearchItemsViewController.self)!
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func coordinateToItemDetails(item: ProductItem) {
        let coordinator = ItemDetailsCoordinator(item: item, navController: navigationController)
        coordinate(to: coordinator)
    }
    
}
