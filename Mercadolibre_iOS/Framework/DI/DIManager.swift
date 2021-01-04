//
//  DIManager.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import Foundation
import Swinject

final class DIManager {
    
    private let container: Container
    
    static var shared: DIManager {
        return DIManager()
    }
    
    init() {
        self.container = Container()
        registerDependencies()
    }
    
    func getContainer() -> Container {
        return self.container
    }
    
    private func registerDependencies() {
        // Data sources
        container.register(SearchItemsRemoteDataSource.self) { _ in
            SearchItemsService()
        }
        
        // Repositories
        container.register(SearchItemsRepository.self) { resolver in
            SearchItemsRepository(resolver.resolve(SearchItemsRemoteDataSource.self)!)
        }
        
        // Interactors
        container.register(SearchItemsInteractor.self) { resolver in
            SearchItemsInteractor(resolver.resolve(SearchItemsRepository.self)!)
        }
        
        //Presenters
        container.register(SearchItemsPresenter.self) { resolver in
            SearchItemsPresenter(resolver.resolve(SearchItemsInteractor.self)!)
        }
        
        //ViewControllers
        container.register(SearchItemsViewController.self) { resolver in
            SearchItemsViewController(presenter: resolver.resolve(SearchItemsPresenter.self)!)
        }
    }
}
