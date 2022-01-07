//
//  UINavigationController+Appearance.swift
//  iMovie
//
//  Created by MorsyElsokary on 04/01/2022.
//

import SwiftUI

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()

        let navBarAppearance = UINavigationBarAppearance()

        navBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white, .font: UIFont(name: "Poppins Bold", size: 40)!,
        ]
        navBarAppearance.configureWithTransparentBackground()

        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }
}
