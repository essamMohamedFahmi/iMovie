import SwiftUI

struct SearchMovieCardView: View {

    // MARK: - Properties

    var movieViewModel: MovieViewModel

    // MARK: - View Components

    private var posterImage: some View {
        Image("MoviePoster")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 170, height: 120)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(
                        Color(
                            .sRGB,
                            red: 150 / 255,
                            green: 150 / 255,
                            blue: 150 / 255,
                            opacity: 0.1), lineWidth: 1)
            )
            .padding(.trailing, 10)
    }

    private var movieTitle: some View {
        Text(movieViewModel.title)
            .font(.iMovieBold(15))
            .foregroundColor(.iMovieBlue)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
    }

    private var releaseDate: some View {
        Text(movieViewModel.releaseDate)
            .font(.iMovieMedium(10))
            .foregroundColor(.gray)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
    }

    private var voteCount: some View {
        Text("\(movieViewModel.voteCount)")
            .font(.iMovieBold(17))
            .foregroundColor(.white)
    }

    private var stars: some View {
        StarsView(rating: Float(movieViewModel.rate), size: 9)
    }

    private var voteCountWord: some View {
        Text("Person")
            .font(.iMovieBold(10))
            .foregroundColor(.iMovieRose)
            .offset(x: 0, y: 2)
    }

    private var watchTrailerButton: some View {
        Button(action: {}) {
            Text("Watch Trailer")
                .font(.iMovieRegular(14))
                .foregroundColor(.white)
        }
        .buttonStyle(GradientBackground(height: 30, width: 140, hPadding: 10, cornerRadius: 5))
    }

    // MARK: - Body

    var body: some View {
        HStack {
            posterImage

            VStack(alignment: .center, spacing: 20) {
                VStack(alignment: .leading, spacing: 4) {
                    movieTitle
                    releaseDate

                    HStack {
                        HStack(spacing: 5) {
                            voteCount
                            voteCountWord
                        }

                        Spacer()
                        stars
                    }
                }

                watchTrailerButton
            }

            Spacer()
        }
    }
}

struct SearchMovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            SearchMovieCardView(movieViewModel: MovieViewModel(title: "The Good Doctor", rate: 3.5, voteCount: 100, releaseDate: "2012-09-25", posterImage: nil))
        }
    }
}
