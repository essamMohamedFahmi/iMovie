import Foundation
import iMovieService

// MARK: - MovieViewModel

struct MovieViewModel: Identifiable {
    let id = UUID()
    let title: String
    let rate: Double
    let voteCount: Int
    let releaseDate: String
    let posterImage: URL?
}

extension MovieViewModel {
    static func build(from model: SearchMovie) -> MovieViewModel? {
        let title = model.title
        let rate = model.voteAverage * 5 / 10
        let voteCount = model.voteCount
        let releaseDate = model.releaseDate

        guard let posterImage = URL(string: "https://image.tmdb.org/t/p/original\(model.posterPath)") else { return nil }

        return MovieViewModel(title: title, rate: rate, voteCount: voteCount, releaseDate: releaseDate, posterImage: posterImage)
    }
}
