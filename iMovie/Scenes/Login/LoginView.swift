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

    @EnvironmentObject var appState: AppState
    @ObservedObject private var loginViewModel = LoginViewModel()

    // MARK: - View Components

    private var mainTitle: some View {
        VStack {
            Text("iMovie")
                .font(.iMovieBold(50))
                .foregroundColor(.white)

            Text("Place of entertainment")
                .font(.iMovieLight(15))
                .foregroundColor(.white)
        }
    }

    private var signInToMovie: some View {
        Text("Sign In To Movie")
            .font(.iMovieBold(30))
            .foregroundColor(.white)
    }

    private var credentialsFields: some View {
        VStack(spacing: 30) {
            FancyTextField(
                text: $loginViewModel.username, spacing: 20, header: "Username", headerTextColor: .iMovieRose, placeholder: "Enter your username")

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

                mainTitle

                Spacer()

                signInToMovie

                credentialsFields

                signInButton

                Spacer()
            }
        }
        .present(isPresented: $loginViewModel.error, type: .toast, position: .top) {
            createToast(with: loginViewModel.errorMessage)
        }
        .onReceive(loginViewModel.$shouldLogin) { shouldLogin in
            if shouldLogin {
                appState.currentRoot = .home
            }
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
