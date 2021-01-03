//
//  Interactor.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import Foundation

protocol Interactor {
    associatedtype Response
    associatedtype Params
    
    func execute(params: Params, completion: @escaping (Response) -> Void)
}
