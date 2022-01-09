//
//  ViewRouter.swift
//  iMovie
//
//  Created by MorsyElsokary on 09/01/2022.
//

import SwiftUI

enum Views {
    case movie
    case actros
    case search
}

class ViewRouter: ObservableObject {
    @Published var currentView: Views = .movie
}
