import Combine
import Foundation

public protocol NetworkRequestable {
    var requestTimeOut: Float { get }
    func request<T: Codable>(_ request: NetworkRequest) -> AnyPublisher<T, NetworkError>
}

public class Requestable: NetworkRequestable {

    // MARK: - Properties

    public var requestTimeOut: Float

    // MARK: - Init

    public init() {
        requestTimeOut = 30.0
    }

    // MARK: - Methods

    public func request<T>(_ request: NetworkRequest) -> AnyPublisher<T, NetworkError>
    where T: Decodable, T: Encodable {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = TimeInterval(
            request.requestTimeOut ?? requestTimeOut)

        guard let url = URL(string: request.url) else {
            // Return a fail publisher if the url is invalid
            return AnyPublisher(
                Fail<T, NetworkError>(error: NetworkError.badURL("Invalid Url"))
            )
        }

        // We use the dataTaskPublisher from the URLSession which gives us a publisher to play around with.
        return URLSession.shared
            .dataTaskPublisher(for: request.buildURLRequest(with: url))
            .tryMap { output in
                // throw an error if response is nil
                guard output.response is HTTPURLResponse else {
                    throw NetworkError.serverError(code: 0, error: "Server error")
                }
                print(String(data: output.data, encoding: .utf8))
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                print(error.localizedDescription)
                // return error if json decoding fails
                return NetworkError.invalidJSON(String(describing: error))
            }
            .eraseToAnyPublisher()
    }
}
