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

                Spacer()
            }
        }
    }
}

struct FancyTextField: View {

    // MARK: - Properties

    var header: String
    var placeholder: String
    @Binding var text: String
    var imageName: String?

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.iMovieRegular(15))
                .foregroundColor(.iMovieRose)

            HStack {
                TextField("", text: $text)
                    .padding([.trailing, .leading], 20)
                    .padding([.top, .bottom], 15)
                    .placeholder(placeholder, when: text.isEmpty)
                    .font(.iMovieRegular(15))
                    .foregroundColor(.white)

                if let imageName = imageName {
                    Image(systemName: imageName)
                        .foregroundColor(Color.white)
                        .padding([.trailing], 15)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.white, lineWidth: 1))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
