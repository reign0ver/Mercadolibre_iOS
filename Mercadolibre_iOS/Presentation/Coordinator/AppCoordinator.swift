//
//  AppCoordinator.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.navigationController = UINavigationController()
        self.window = window
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        coordinateToMainCoordinator()
    }
    
    private func coordinateToMainCoordinator() {
        let searchItemsCoordinator = SearchItemsCoordinator(navController: navigationController) // class variable?
        coordinate(to: searchItemsCoordinator)
    }
}
