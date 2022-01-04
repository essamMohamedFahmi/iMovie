//
//  iMovieCardView.swift
//  iMovie
//
//  Created by MorsyElsokary on 04/01/2022.
//

import SwiftUI

struct iMovieCardView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                Image("MoviePoster")
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
                    Text("The Good Doctor")
                        .font(.iMovieBold(15))
                        .lineLimit(3)
                        .minimumScaleFactor(0.5)
                    
                    Text("Sep 25, 2017")
                        .font(.iMovieLight(15))
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.gray)
                }
            }
            
            LoadingProgress()
                .offset(x: -30, y: 75)
        }
    }
}

struct iMovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        iMovieCardView()
    }
}

// MARK: Loading Progress

struct LoadingProgress: View {
    
    @State private var isLoading = false
    @State private var progress: CGFloat = 0.75
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.black)
                .frame(width: 60, height: 60)
            
            HStack(spacing: 0) {
                Text("\(Int(progress * 100))")
                    .font(.iMovieBold(15))
                    .foregroundColor(.white)
                    .overlay(
                        Text("%")
                            .font(.iMovieBold(10))
                            .foregroundColor(.white)
                            .offset(x: 12, y: -6)
                    )
            }
            .padding()
            
            Circle()
                .stroke(Color.iMovieRose.opacity(0.6), lineWidth: 5)
                .frame(width: 50, height: 50)
            
            Circle()
                .trim(from: 0, to: isLoading ? progress : 0)
                .stroke(Color.iMovieRose, lineWidth: 3)
                .frame(width: 50, height: 50)
                .rotationEffect(Angle(degrees: -90))
                .animation(Animation.default.delay(1.0), value: isLoading)
        }
        .onAppear {
            isLoading.toggle()
        }
    }
}
