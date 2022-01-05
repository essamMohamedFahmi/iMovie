//
//  iMovieCardView.swift
//  iMovie
//
//  Created by MorsyElsokary on 04/01/2022.
//

import SwiftUI

struct iMovieCardView: View {
    
    // MARK: - Properties
    
    var moviePoster: String
    var movieTitle: String
    var movieReleaseDate: String
    var rateColor: Color
    var rate: CGFloat
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                Image(moviePoster)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 225)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(.sRGB,
                                              red: 150/255,
                                              green: 150/255,
                                              blue: 150/255,
                                              opacity: 0.1), lineWidth: 1))
                
                VStack(alignment: .leading) {
                    Text(movieTitle)
                        .font(.iMovieBold(15))
                        .lineLimit(3)
                        .minimumScaleFactor(0.5)
                    
                    Text(movieReleaseDate)
                        .font(.iMovieRegular(15))
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.gray)
                }
            }
            
            RatingCircle(rate: rate , rateColor: rateColor)
                .offset(x: -30, y: 75)
        }
    }
}

struct iMovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        iMovieCardView(moviePoster: "MoviePoster",
                       movieTitle: "The Good Doctor",
                       movieReleaseDate: "Sep 25,2017",
                       rateColor: .iMovieRose,
                       rate: 0.86)
    }
}
