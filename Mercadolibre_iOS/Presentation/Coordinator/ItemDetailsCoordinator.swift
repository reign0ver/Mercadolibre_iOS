//
//  ItemDetailsCoordinator.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 4/01/21.
//

import UIKit

final class ItemDetailsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() { // TODO
//        let vc = AppDelegate.shared.diManager.getContainer().resolve(SearchItemsViewController.self)!
//        vc.coordinator = self
//        navigationController.pushViewController(vc, animated: true)
    }
    
}
