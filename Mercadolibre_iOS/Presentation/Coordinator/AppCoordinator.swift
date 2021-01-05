//
//  AppCoordinator.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import UIKit

protocol StartFlow: class {
    func startFlow()
}

final class AppCoordinator: Coordinator, StartFlow {
    
    var navigationController: UINavigationController
    private let window: UIWindow
    private let searchItemsCoordinator: SearchItemsCoordinator
    
    init(window: UIWindow) {
        self.navigationController = UINavigationController()
        self.window = window
        self.searchItemsCoordinator = SearchItemsCoordinator(navController: navigationController)
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        startFlow()
    }
    
    func startFlow() {
        coordinate(to: searchItemsCoordinator)
    }
}
