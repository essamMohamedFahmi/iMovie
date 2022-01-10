//
//  ContentPickerView.swift
//  iMovie
//
//  Created by MorsyElsokary on 08/01/2022.
//

import SwiftUI

enum ContentCriteria: String, CaseIterable {
    case popural
    case new
    case soon
    case trailer

    var text: String {
        switch self {
        case .popural: return "Popural"
        case .new: return "New"
        case .soon: return "Soon"
        case .trailer: return "Trailer"
        }
    }
}

struct ContentPickerView: View {

    // MARK: - Properties

    @State private var contentType: ContentCriteria = .popural

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack(spacing: 15) {
                ForEach(ContentCriteria.allCases, id: \.self) { type in
                    PickerSelector(title: type.text.uppercased(), isSelected: contentType == type)
                        .onTapGesture {
                            contentType = type
                        }
                }
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)

            switch contentType {
            case .popural:
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        iMovieCardView(
                            moviePoster: "MoviePoster", movieTitle: "The good doctor",
                            movieReleaseDate: "Jan 26, 2017", rateColor: .iMoviePurpure, rate: 0.75)
                        iMovieCardView(
                            moviePoster: "MoviePoster", movieTitle: "The good doctor",
                            movieReleaseDate: "Jan 26, 2017", rateColor: .iMoviePurpure, rate: 0.75)
                        iMovieCardView(
                            moviePoster: "MoviePoster", movieTitle: "The good doctor",
                            movieReleaseDate: "Jan 26, 2017", rateColor: .iMoviePurpure, rate: 0.75)
                    }
                    .padding([.bottom, .leading], 10)
                }
            case .new:
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        iMovieCardView(
                            moviePoster: "MoviePoster", movieTitle: "The good doctor",
                            movieReleaseDate: "Jan 26, 2017", rateColor: .iMoviePurpure, rate: 0.75)
                        iMovieCardView(
                            moviePoster: "MoviePoster", movieTitle: "The good doctor",
                            movieReleaseDate: "Jan 26, 2017", rateColor: .iMoviePurpure, rate: 0.75)
                        iMovieCardView(
                            moviePoster: "MoviePoster", movieTitle: "The good doctor",
                            movieReleaseDate: "Jan 26, 2017", rateColor: .iMoviePurpure, rate: 0.75)
                    }
                    .padding([.bottom, .leading], 10)
                }
            case .soon:
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        iMovieCardView(
                            moviePoster: "MoviePoster", movieTitle: "The good doctor",
                            movieReleaseDate: "Jan 26, 2017", rateColor: .iMoviePurpure, rate: 0.75)
                        iMovieCardView(
                            moviePoster: "MoviePoster", movieTitle: "The good doctor",
                            movieReleaseDate: "Jan 26, 2017", rateColor: .iMoviePurpure, rate: 0.75)
                        iMovieCardView(
                            moviePoster: "MoviePoster", movieTitle: "The good doctor",
                            movieReleaseDate: "Jan 26, 2017", rateColor: .iMoviePurpure, rate: 0.75)
                    }
                    .padding([.bottom, .leading], 10)
                }
            case .trailer:
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        iMovieCardView(
                            moviePoster: "MoviePoster", movieTitle: "The good doctor",
                            movieReleaseDate: "Jan 26, 2017", rateColor: .iMoviePurpure, rate: 0.75)
                        iMovieCardView(
                            moviePoster: "MoviePoster", movieTitle: "The good doctor",
                            movieReleaseDate: "Jan 26, 2017", rateColor: .iMoviePurpure, rate: 0.75)
                        iMovieCardView(
                            moviePoster: "MoviePoster", movieTitle: "The good doctor",
                            movieReleaseDate: "Jan 26, 2017", rateColor: .iMoviePurpure, rate: 0.75)
                    }
                    .padding([.bottom, .leading], 10)
                }
            }
        }
        .background(.clear)
    }
}

struct iMoviePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            ContentPickerView()
        }
    }
}

struct PickerSelector: View {

    //MARK: - Properties
    var title: String
    var isSelected: Bool = false

    //MARK: - Body

    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Text(title)
                .font(.iMovieBold(15))
                .foregroundColor(isSelected ? .iMovieBlue : .white)

            Rectangle()
                .frame(height: 2, alignment: .center)
                .foregroundColor(.iMovieBlue)
                .foregroundColor(isSelected ? .iMovieBlue : .white)
                .opacity(isSelected ? 1 : 0)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}
