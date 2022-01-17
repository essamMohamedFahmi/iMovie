//
//  iMovieApp.swift
//  iMovie
//
//  Created by Essam Fahmi on 25/12/2021.
//

import SwiftUI

@main
struct iMovieApp: App {

    // MARK: - Properties

    @StateObject var appState = AppState(hasOnboarded: false)

    // MARK: - Body

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
