import Combine
import Foundation

public protocol SearchServiceable {
    func searchMovies(query: String) -> AnyPublisher<SearchResponse, NetworkError>
}

public class SearchService: SearchServiceable {

    // MARK: - Properties

    private var networkRequest: NetworkRequestable

    // MARK: - Init

    public init(networkRequest: NetworkRequestable = Requestable()) {
        self.networkRequest = networkRequest
    }

    // MARK: - Methods

    public func searchMovies(query: String) -> AnyPublisher<SearchResponse, NetworkError> {
        let endpoint = SearchServiceEndpoints.searchMovies(query: query)
        let request = endpoint.createRequest()
        return networkRequest.request(request)
    }
}
