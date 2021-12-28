//
//  BlurEffectView.swift
//  iMovie
//
//  Created by MorsyElsokary on 27/12/2021.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable {
    
    // MARK: - Properties

    var effect: UIVisualEffect?
    
    // MARK: - Methods
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        UIVisualEffectView()
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        uiView.effect = effect
    }
}
