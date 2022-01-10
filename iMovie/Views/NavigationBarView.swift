//
//  NavigationBarView.swift
//  iMovie
//
//  Created by MorsyElsokary on 08/01/2022.
//

import SwiftUI

struct NavigationBarView: View {

    // MARK: - Properties

    @State private var logoAnimated: Bool = false
    @State private var showProfile: Bool = false

    // MARK: - Body

    var body: some View {
        HStack {
            Button {
            } label: {
                Image(systemName: "text.justify")
                    .font(.title)
                    .foregroundColor(.white)
            }

            Spacer()

            Text("Movie")
                .opacity(logoAnimated ? 1 : 0)
                .offset(x: 0, y: logoAnimated ? 0 : -35)
                .font(.iMovieBold(25))
                .foregroundColor(.white)
                .onAppear {
                    withAnimation(.easeOut(duration: 0.8)) {
                        logoAnimated.toggle()
                    }
                }

            Spacer()

            Button {
                self.showProfile = true
            } label: {
                Image(systemName: "person")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .fullScreenCover(
                isPresented: $showProfile,
                content: ProfileView.init)
        }
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            NavigationBarView()
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
