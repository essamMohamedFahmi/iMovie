//
//  GradientBackground.swift
//  iMovie
//
//  Created by Essam Fahmi on 07/01/2022.
//

import SwiftUI

struct GradientBackground: ButtonStyle {

    var height: CGFloat
    var width: CGFloat = .infinity
    var hPadding: CGFloat = 30
    var cornerRadius: CGFloat = 25

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .frame(minWidth: 0, maxWidth: width)
            .frame(height: height)
            .foregroundColor(.white)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.iMovieBlue, Color.iMoviePurpure]),
                    startPoint: .leading,
                    endPoint: .trailing)
            )
            .cornerRadius(cornerRadius)
            .padding(.horizontal, hPadding)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
