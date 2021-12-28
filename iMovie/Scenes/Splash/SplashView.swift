//
//  SplashView.swift
//  iMovie
//
//  Created by Essam Fahmi on 25/12/2021.
//

import SwiftUI

struct SplashView: View {

    // MARK: - Properties

    @State var progressValue: Float = 0.0

    private enum Strings {
        static let spalshAnimationFileName = "panda"
    }

    // MARK: - Body

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.iMovieRose, Color.iMovieDarkBlue]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.vertical)
            .overlay(
                LottieView(name: Strings.spalshAnimationFileName)
                    .offset(y: -20)
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
