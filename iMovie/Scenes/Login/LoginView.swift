//
//  LoginView.swift
//  iMovie
//
//  Created by Essam Fahmi on 03/01/2022.
//

import SwiftUI

struct LoginView: View {

    @State private var email = ""
    @State private var password = ""

    var body: some View {
        ZStack {
            BackgroundView()

            VStack {
                Spacer()

                Text("iMovie")
                    .font(.iMovieBold(50))
                    .foregroundColor(.white)

                Text("Place of entertainment")
                    .font(.iMovieLight(15))
                    .foregroundColor(.white)

                Spacer()

                Text("Sign In To Movie")
                    .font(.iMovieBold(30))
                    .foregroundColor(.white)

                VStack(spacing: 30) {
                    FancyTextField(header: "Email", placeholder: "Enter your email", text: $email)

                    FancyTextField(
                        header: "Password", placeholder: "Enter your password", text: $password,
                        imageName: "eye.fill")
                }
                .padding(30)

                Button(action: {}) {
                    Text("Sign In")
                        .font(.iMovieRegular(20))
                        .foregroundColor(.white)
                }
                .buttonStyle(GradientBackground(height: 55))

                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
