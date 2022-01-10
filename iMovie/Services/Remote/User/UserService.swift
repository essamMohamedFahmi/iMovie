//
//  UserService.swift
//  iMovie
//
//  Created by Essam Fahmi on 08/01/2022.
//

import Combine
import Foundation

struct User {
    var username: String
    var email: String
}

protocol UserServiceProtocol {
    func login(username: String, password: String) -> AnyPublisher<User, Error>
}

struct AuthError: LocalizedError {
    var errorDescription: String? {
        "Credentials are wrong!"
    }
}

final class UserService: UserServiceProtocol {

    // MARK: - Methods

    func login(username: String, password: String) -> AnyPublisher<User, Error> {
        Future<User, Error> { promise in
            if username == "" && password == "" {
                promise(.success(User(username: "essam", email: "essam@gmail.com")))
            } else {
                promise(.failure(AuthError()))
            }
        }.eraseToAnyPublisher()
    }
}
