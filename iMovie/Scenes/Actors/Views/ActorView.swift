//
//  ActorView.swift
//  iMovie
//
//  Created by Essam Fahmi on 15/01/2022.
//

import SwiftUI

struct ActorView: View {

    // MARK: - Properties

    var name: String
    var profile: String
    var popularMovie: String
    var gender: String
    var popularity: String

    // MARK: - View Components

    var profileImage: some View {
        Image(profile)
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 120)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(
                        Color(
                            .sRGB,
                            red: 150 / 255,
                            green: 150 / 255,
                            blue: 150 / 255,
                            opacity: 0.1), lineWidth: 1)
            )
            .padding([.leading], 20)
            .offset(x: 0, y: -25)
    }

    var nameText: some View {
        Text(name)
            .font(.iMovieBold(15))
            .foregroundColor(.white)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
    }

    var genderText: some View {
        Text(gender)
            .font(.iMovieRegular(15))
            .foregroundColor(.white)
    }

    var popularMovieText: some View {
        Text(popularMovie)
            .font(.iMovieRegular(15))
            .minimumScaleFactor(0.5)
            .foregroundColor(.white)
    }

    var popularityText: some View {
        Text(popularity)
            .font(.iMovieBold(15))
            .foregroundColor(.white)
            .padding([.top, .trailing], 15)
    }

    // MARK: - Body

    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .frame(height: 100)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.iMovieBlue, Color.purple]),
                    startPoint: .leading,
                    endPoint: .trailing)
            )
            .cornerRadius(10)
            .overlay(
                HStack(spacing: 20) {
                    profileImage

                    HStack(spacing: 15) {
                        VStack(alignment: .leading) {
                            nameText
                            genderText
                            popularMovieText
                            Spacer()
                        }
                        .padding(.top, 15)

                        VStack {
                            popularityText
                            Spacer()
                        }
                    }
                }
            )
            .padding(.top, 35)
    }
}

struct ActorView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            ActorView(
                name: "Tom Holland", profile: "actor", popularMovie: "Avengers: Infinity War",
                gender: "male", popularity: "145.03")
        }
    }
}
