//
//  ProgressBar.swift
//  iMovie
//
//  Created by Essam Fahmi on 28/12/2021.
//

import SwiftUI

struct ProgressBar: View {

    // MARK: - Properties

    var width: CGFloat
    @State private var isLoading = false

    // MARK: - Body

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color.gray, lineWidth: 3)
                .frame(width: width, height: 3)

            RoundedRectangle(cornerRadius: 3)
                .stroke(Color.purple, lineWidth: 3)
                .frame(width: 30, height: 3)
                .offset(x: isLoading ? 110 : -110, y: 0) .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
        }
        .onAppear() {
            self.isLoading = true
        }
    }
}
