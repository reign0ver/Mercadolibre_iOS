//
//  BaseNetwork.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import Foundation
import Alamofire

class BaseNetwork {
    
    //TODO: Check error handling (refactor if possible)
    func sendRequest<T: Decodable>(_ endpoint: String, of: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let requestURL = NetworkConstants.baseURL + endpoint
        
        let request = AF.request(requestURL, method: .get)
        request
            .validate(statusCode: 200..<300)
            .responseDecodable(of: T.self, queue: .global(qos: .background)) { response in
                if let error = response.error {
                    print(error)
                    completion(.failure(.parsingData))
                    return
                }
                let validationResult = response.result
                switch validationResult {
                case .success(let object):
                    completion(.success(object))
                    break
                case .failure(let error):
                    print(error)
                    completion(.failure(.responseUnsuccessfull))
                    break
                }
        }
    }
}
