import Foundation

enum SearchServiceEndpoints {

    case searchMovies(query: String)

    var requestTimeOut: Int {
        return 20
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .searchMovies:
            return .GET
        }
    }

    func createRequest(token: String? = nil) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"] = "application/json"
        if let token = token {
            headers["Authorization"] = "Bearer \(token)"
        }
        return NetworkRequest(
            url: getURL(), headers: headers, requestBody: requestBody, httpMethod: httpMethod)
    }

    var requestBody: Encodable? {
        switch self {
        default:
            return nil
        }
    }

    func getURL() -> String {
        let baseUrl = "https://api.themoviedb.org/3"
        switch self {
        case .searchMovies(let query):
            return "\(baseUrl)/search/movie?api_key=\(TMDBKeys.apiKey)&language=en-US&query=\(query)&page=1"
        }
    }
}
