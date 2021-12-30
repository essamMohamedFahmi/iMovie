//
//  AppState.swift
//  iMovie
//
//  Created by Essam Fahmi on 30/12/2021.
//

import Foundation

class AppState: ObservableObject {

    // MARK: - Properties

    @Published var hasOnboarded: Bool

    // MARK: - Init

    init(hasOnboarded: Bool) {
        self.hasOnboarded = hasOnboarded
    }
}
