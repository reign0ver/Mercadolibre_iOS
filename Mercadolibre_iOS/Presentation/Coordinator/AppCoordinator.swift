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
        coordinateToTabBar()
    }
    
    private func coordinateToTabBar() { //rename
        //TODO
        let vc = ViewController()
        navigationController.pushViewController(vc, animated: true)
        //coordinate(to: tabBarCoordinator)
    }
}
