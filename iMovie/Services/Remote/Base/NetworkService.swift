//
//  NetworkService.swift
//  iMovie
//
//  Created by MorsyElsokary on 15/01/2022.
//

import Alamofire
import Combine

protocol NetworkServiceProtocol {
    associatedtype T: URLRequestBuilder
    func request<M: Codable>(_ urlRequest: T, model: M.Type, completion: @escaping (Result<M, AFError>) -> Void) -> AnyCancellable
}


class NetworkService<T: URLRequestBuilder>: NetworkServiceProtocol {
    
    func request<M: Codable>(_ urlRequest: T, model: M.Type, completion: @escaping (Result<M, AFError>) -> Void) -> AnyCancellable {
        let requestPublisher =  AF.request(urlRequest).publishDecodable(type: model.self)
        
        let cancellable = requestPublisher
            .subscribe(on: DispatchQueue(label: "Background Queue", qos: .background))
            .receive(on: RunLoop.main)
            .sink { result in
                if let value = result.value {
                    completion(Result.success(value))
                } else if let error = result.error {
                    completion(Result.failure(error))
                }
            }
        return cancellable
    }
}

