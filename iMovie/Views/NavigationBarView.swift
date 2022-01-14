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

    // MARK: - View Components

    private var hamburgerMenuButton: some View {
        Button {
        } label: {
            Image(systemName: "text.justify")
                .resizable()
                .frame(width: 20, height: 20)
                .font(.title)
                .foregroundColor(.white)
                .padding(.leading, 5.0)
        }
    }

    private var navLogo: some View {
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
    }

    private var showProfileButton: some View {
        Button {
            self.showProfile = true
        } label: {
            Image(systemName: "person")
                .resizable()
                .frame(width: 20, height: 20)
                .font(.title)
                .foregroundColor(.white)
                .padding(.trailing, 5.0)
        }
        .fullScreenCover(
            isPresented: $showProfile,
            content: ProfileView.init)
    }

    // MARK: - Body

    var body: some View {
        HStack {
            hamburgerMenuButton

            Spacer()

            navLogo

            Spacer()

            showProfileButton
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
