//
//  FancyTextField.swift
//  iMovie
//
//  Created by Essam Fahmi on 07/01/2022.
//

import SwiftUI

struct FancyTextField: View {

    // MARK: - Properties

    @Binding var text: String
    var textColor: Color = .white
    var textSize: CGFloat = 15
    var spacing: CGFloat = 0
    var textTopBottomPadding: CGFloat = 15
    var header: String?
    var headerTextColor: Color = .white
    var placeholder: String = ""
    var placeholderTextColor: Color = .white
    var rightImageName: String?
    var rightImageColor: Color = .white
    var rightImagePadding: CGFloat = 15
    var leftImageName: String?
    var leftImageColor: Color = .white
    var leftImagePadding: CGFloat = 15
    var cornerRadius: CGFloat = 25
    var borderWidth: CGFloat = 1

    /// Set it to true to change color of images to text color when it is not empty
    var enableMatching: Bool = false

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading) {
            if let header = header {
                Text(header)
                    .font(.iMovieRegular(15))
                    .foregroundColor(headerTextColor)
            }

            HStack(spacing: spacing) {
                if let imageName = leftImageName {
                    Image(systemName: imageName)
                        .foregroundColor(enableMatching ? (text.isEmpty ? leftImageColor : textColor) : leftImageColor)
                        .padding([.leading], leftImagePadding)
                }

                TextField("", text: $text)
                    .padding([.leading, .trailing], spacing)
                    .padding([.top, .bottom], textTopBottomPadding)
                    .placeholder(placeholder, when: text.isEmpty, padding: spacing, color: placeholderTextColor)
                    .font(.iMovieRegular(textSize))
                    .foregroundColor(textColor)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)

                if let imageName = rightImageName {
                    Image(systemName: imageName)
                        .foregroundColor(enableMatching ? (text.isEmpty ? rightImageColor : textColor) : leftImageColor)
                        .padding([.trailing], rightImagePadding)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.white, lineWidth: borderWidth)
            )
        }
    }
}
