import Combine
import Foundation

public struct User {
    var username: String
    var email: String
}

public protocol UserServiceProtocol {
    func login(username: String, password: String) -> AnyPublisher<User, Error>
}

public struct AuthError: LocalizedError {
    public var errorDescription: String? {
        "Credentials are wrong!"
    }
}

public final class UserService: UserServiceProtocol {

    // MARK: - Init

    public init() {}

    // MARK: - Methods

    public func login(username: String, password: String) -> AnyPublisher<User, Error> {
        Future<User, Error> { promise in
            if username == "" && password == "" {
                promise(.success(User(username: "essam", email: "essam@gmail.com")))
            } else {
                promise(.failure(AuthError()))
            }
        }.eraseToAnyPublisher()
    }
}
