//
//  ItemDetailsCoordinator.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 4/01/21.
//

import UIKit

final class ItemDetailsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    private let item: ProductItem
    
    init(item: ProductItem, navController: UINavigationController) {
        self.navigationController = navController
        self.item = item
    }
    
    func start() {
        let vc = ItemDetailViewController(item: item)
        navigationController.pushViewController(vc, animated: true)
    }
    
}
