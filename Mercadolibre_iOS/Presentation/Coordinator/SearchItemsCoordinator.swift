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
        let vc = AppDelegate.shared.diManager.getContainer().resolve(SearchItemsViewController.self)!
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showItemDetails() {
        // TODO
    }
    
}
