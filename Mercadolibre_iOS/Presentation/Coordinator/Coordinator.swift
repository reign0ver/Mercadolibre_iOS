//
//  Coordinator.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import UIKit

protocol Coordinator: class {
    var navigationController: UINavigationController { get set }
    
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
