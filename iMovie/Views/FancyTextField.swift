//
//  FancyTextField.swift
//  iMovie
//
//  Created by Essam Fahmi on 07/01/2022.
//

import SwiftUI

struct FancyTextField: View {

    // MARK: - Properties

    var header: String
    var placeholder: String
    @Binding var text: String
    var imageName: String?
    var cornerRadius: CGFloat = 25

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
                    .autocapitalization(.none)
                    .disableAutocorrection(true)

                if let imageName = imageName {
                    Image(systemName: imageName)
                        .foregroundColor(Color.white)
                        .padding([.trailing], 15)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.white, lineWidth: 1)
            )
        }
    }
}
