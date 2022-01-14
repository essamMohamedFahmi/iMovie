//
//  PasswordTextField.swift
//  iMovie
//
//  Created by Essam Fahmi on 09/01/2022.
//

import SwiftUI

struct PasswordTextField: View {

    // MARK: - Properties

    @Binding var text: String
    @State var isSecure = false

    var header = "Password"
    var placeholder = "Enter your password"
    var cornerRadius: CGFloat = 25

    // MARK: - View Properties

    private var textField: some View {
        TextField("", text: $text)
            .padding([.trailing, .leading], 20)
            .padding([.top, .bottom], 15)
            .placeholder(placeholder, when: text.isEmpty)
            .font(.iMovieRegular(15))
            .foregroundColor(.white)
    }

    private var secureTextField: some View {
        SecureField("", text: $text)
            .padding([.trailing, .leading], 20)
            .padding([.top, .bottom], 15)
            .placeholder(placeholder, when: text.isEmpty)
            .font(.iMovieRegular(15))
            .foregroundColor(.white)
    }

    private var eyeImage: some View {
        Image(systemName: isSecure ? "eye.slash.fill" : "eye.fill")
            .foregroundColor(Color.white)
            .padding([.trailing], 15)
            .onTapGesture {
                isSecure.toggle()
            }
    }

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.iMovieRegular(15))
                .foregroundColor(.iMovieRose)

            HStack {
                if isSecure {
                    secureTextField
                } else {
                    textField
                }

                eyeImage
            }
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.white, lineWidth: 1)
            )
        }
    }
}
