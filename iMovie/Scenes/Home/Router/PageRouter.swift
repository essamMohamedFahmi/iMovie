//
//  PageRouter.swift
//  iMovie
//
//  Created by MorsyElsokary on 09/01/2022.
//

import SwiftUI

enum HomePage {
    case movies
    case actors
    case search
}

class PageRouter: ObservableObject {

    // MARK: - Properties

    @Published var currentPage: HomePage

    // MARK: - Init

    init(currentPage: HomePage) {
        self.currentPage = currentPage
    }
}
