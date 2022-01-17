import Foundation

typealias Headers = [String: String]

enum ActorsServiceEndpoints {

    // organise all the end points here for clarity
    case getActors

    // gave a default timeout but can be different for each.
    var requestTimeOut: Int {
        return 20
    }

    // specify the type of HTTP request
    var httpMethod: HTTPMethod {
        switch self {
        case .getActors:
            return .GET
        }
    }

    // compose the NetworkRequest
    func createRequest(token: String? = nil) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"] = "application/json"
        if let token = token {
            headers["Authorization"] = "Bearer \(token)"
        }
        return NetworkRequest(
            url: getURL(), headers: headers, requestBody: requestBody, httpMethod: httpMethod)
    }

    // encodable request body for POST
    var requestBody: Encodable? {
        switch self {
        default:
            return nil
        }
    }

    // compose urls for each request
    func getURL() -> String {
        let baseUrl = "https://api.themoviedb.org/3"
        switch self {
        case .getActors:
            return "\(baseUrl)/person/popular?api_key=\(TMDBKeys.apiKey)&language=en-US"
        }
    }
}
