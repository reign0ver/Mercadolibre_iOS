//
//  BaseNetwork.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import Foundation
import Alamofire

class BaseNetwork {
    
    func sendRequest<T: Decodable>(_ endpoint: String, of: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let requestURL = NetworkConstants.baseURL + endpoint
        
        AF.request(requestURL, method: .get)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: T.self, queue: .global(qos: .background)) { response in
                let result = response.result
                switch result {
                case .success(let object):
                    completion(.success(object))
                    break
                case .failure(let error):
                    if error.isInvalidURLError {
                        completion(.failure(.invalidURL))
                        print("..::Invalid URL or query param::.. \n \(error)")
                        break
                    }
                    if error.isResponseSerializationError {
                        completion(.failure(.parsingData))
                        print("..::Error while parsing data::.. \n \(error)")
                        break
                    }
                    print("..::Any other error::.. \n \(error)")
                    break
                }
            }
    }
    // TODO - Another func to validate errors
}
