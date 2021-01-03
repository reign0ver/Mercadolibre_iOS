//
//  NetworkErrors.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import Foundation

enum NetworkError: String, Error {
    case genericError = "Generic Error"
    case parsingData = "Parsing Error"
    case responseUnsuccessfull = "Response Unsuccessfull"
    case reachability = "No internet conection detected"
}
