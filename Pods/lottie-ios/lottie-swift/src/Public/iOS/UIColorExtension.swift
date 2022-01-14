//
//  UIColorExtension.swift
//  lottie-swift
//
//  Created by Brandon Withrow on 2/4/19.
//

import Foundation

#if os(iOS) || os(tvOS) || os(watchOS) || targetEnvironment(macCatalyst)
    import UIKit

    extension UIColor {

        public var lottieColorValue: Color {
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            getRed(&r, green: &g, blue: &b, alpha: &a)
            return Color(r: Double(r), g: Double(g), b: Double(b), a: Double(a))
        }

    }
#endif
