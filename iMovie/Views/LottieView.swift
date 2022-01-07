//
//  LottiView.swift
//  iMovie
//
//  Created by Essam Fahmi on 26/12/2021.
//

import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {

    // MARK: - Properties

    var name: String
    var loopMode: LottieLoopMode = .loop

    // MARK: - Methods

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = AnimationView()
        let animation = Animation.named(name)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
