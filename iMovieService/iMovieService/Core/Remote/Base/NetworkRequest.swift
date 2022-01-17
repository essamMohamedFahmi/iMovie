import Foundation

public struct NetworkRequest {
    let url: String
    let headers: [String: String]?
    let body: Data?
    let requestTimeOut: Float?
    let httpMethod: HTTPMethod

    public init(
        url: String,
        headers: [String: String]? = nil,
        requestBody: Encodable? = nil,
        requestTimeout: Float? = nil,
        httpMethod: HTTPMethod
    ) {
        self.url = url
        self.headers = headers
        self.body = requestBody?.encode()
        self.requestTimeOut = requestTimeout
        self.httpMethod = httpMethod
    }

    public init(
        url: String,
        headers: [String: String]? = nil,
        requestBody: Data? = nil,
        requestTimeout: Float? = nil,
        httpMethod: HTTPMethod
    ) {
        self.url = url
        self.headers = headers
        self.body = requestBody
        self.requestTimeOut = requestTimeout
        self.httpMethod = httpMethod
    }

    func buildURLRequest(with url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = headers ?? [:]
        urlRequest.httpBody = body
        return urlRequest
    }
}
