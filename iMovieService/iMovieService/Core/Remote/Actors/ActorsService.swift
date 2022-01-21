import Combine
import Foundation

public protocol ActorsServiceable {
    func getActors() -> AnyPublisher<ActorsResponse, NetworkError>
}

public class ActorsService: ActorsServiceable {

    // MARK: - Properties

    private var networkRequest: NetworkRequestable

    // MARK: - Init

    public init(networkRequest: NetworkRequestable = Requestable()) {
        self.networkRequest = networkRequest
    }

    // MARK: - Methods

    public func getActors() -> AnyPublisher<ActorsResponse, NetworkError> {
        let endpoint = ActorsServiceEndpoints.getActors
        let request = endpoint.createRequest()
        return networkRequest.request(request)
    }
}
