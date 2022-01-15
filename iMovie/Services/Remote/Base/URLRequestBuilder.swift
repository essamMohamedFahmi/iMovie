//
//  URLRequestBuilder.swift
//  iMovie
//
//  Created by MorsyElsokary on 15/01/2022.
//

import Alamofire

/// The protocol used to safley construct `URLRequest` .
protocol URLRequestBuilder: URLRequestConvertible {
    
    /// The target's base `URL`.
    var baseURL: URL { get }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }
    
    /// The full url with the path appended .
    var requestURL: URL { get }
    
    /// A dictionary of parameters to apply to a `URLRequest` .
    var parameters: Parameters? { get }
    
    /// The HTTP method used in the request .
    var httpMethod: HTTPMethod { get }
    
    /// A type used to define how a set of parameters are applied to a `URLRequest`.
    var encoding: ParameterEncoding { get }
    
    /// A URL load request that is independent of protocol or URL scheme.
    var urlRequest: URLRequest { get }
}

extension URLRequestBuilder {
    var requestURL: URL {
        baseURL.appendingPathComponent(path, isDirectory: false)
    }
    
    var encoding: ParameterEncoding {
        switch httpMethod {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var headers: HTTPHeaders {
        let header = HTTPHeaders()
        return header
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = httpMethod.rawValue
        headers.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.name)
        }
        return request
    }
    
    func asURLRequest() throws -> URLRequest {
        return try encoding.encode(urlRequest, with: parameters)
    }
}
