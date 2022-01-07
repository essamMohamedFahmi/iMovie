//
//  SplashView.swift
//  iMovie
//
//  Created by Essam Fahmi on 25/12/2021.
//

import SwiftUI

struct SplashView: View {

    // MARK: - Properties

    @EnvironmentObject var appState: AppState

    private enum Strings {
        static let spalshAnimationFileName = "panda"
    }

    // MARK: - Body

    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.iMovieRose, Color.iMovieDarkBlue]), startPoint: .top,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.vertical)
        .overlay(
            LottieView(name: Strings.spalshAnimationFileName)
                .offset(y: -20)
        )
        .task { await delay() }
    }

    private func delay() async {
        // Delay of 2 seconds (1 second = 1_000_000_000 nanoseconds)
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        DispatchQueue.main.async {
            appState.hasOnboarded = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
