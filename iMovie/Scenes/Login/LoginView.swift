//
//  LoginView.swift
//  iMovie
//
//  Created by Essam Fahmi on 03/01/2022.
//

import SSToastMessage
import SwiftUI

struct LoginView: View {

    // MARK: - Properties

    @ObservedObject private var loginViewModel = LoginViewModel()

    // MARK: - View Components

    private var credentialsFields: some View {
        VStack(spacing: 30) {
            FancyTextField(
                header: "Username", placeholder: "Enter your username",
                text: $loginViewModel.username)

            PasswordTextField(text: $loginViewModel.password, isSecure: true)
        }
        .padding(30)
    }

    private var signInButton: some View {
        Button(action: {
            loginViewModel.login()
        }) {
            Text("Sign In")
                .font(.iMovieRegular(20))
                .foregroundColor(.white)
        }
        .buttonStyle(GradientBackground(height: 55))
    }

    // MARK: - Body

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

                credentialsFields

                signInButton

                Spacer()
            }
        }
        .fullScreenCover(
            isPresented: $loginViewModel.shouldLogin,
            content: ProfileView.init
        )
        .present(isPresented: $loginViewModel.error, type: .toast, position: .top) {
            self.createToast(with: loginViewModel.errorMessage)
        }
    }

    // MARK: - Methods

    func createToast(with message: String) -> some View {
        VStack {
            Spacer()

            HStack {
                Text(message)
                    .font(.iMovieRegular(14))
                    .foregroundColor(.white)
                    .padding()

                Spacer()
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 85)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.iMovieBlue, Color.iMoviePurpure]),
                startPoint: .leading,
                endPoint: .trailing)
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
