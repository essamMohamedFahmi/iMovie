//
//  SplashView.swift
//  iMovie
//
//  Created by Essam Fahmi on 25/12/2021.
//

import SwiftUI

struct SplashView: View {

    // MARK: - Properties

    private enum Strings {
        static let spalshAnimationFileName = "splash_iMovie"
    }

    // MARK: - Body

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.iMovieRose, Color.iMovieDarkBlue]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.vertical)
            .overlay(
                LottieView(name: Strings.spalshAnimationFileName)
                    .padding([.leading, .trailing], 30.0)
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
