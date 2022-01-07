//
//  View+Placeholder.swift
//  iMovie
//
//  Created by Essam Fahmi on 03/01/2022.
//

import SwiftUI

extension View {
    func placeholder(
        _ text: String,
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        padding: CGFloat = 20) -> some View {
        placeholder(when: shouldShow, alignment: alignment) {
            Text(text)
                .foregroundColor(.white)
                .padding([.trailing, .leading], padding)
        }
    }

    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
