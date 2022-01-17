import Foundation
import iMovieService

// MARK: - ActorViewModel

struct ActorViewModel: Identifiable {

    // MARK: - Properties

    let id = UUID()
    let name: String
    let gender: String
    let popularity: String
    let profileImage: URL
    let popularMovie: String

    // MARK: - Methods

    static func build(from actor: Actor) -> ActorViewModel? {

        let name = actor.name
        let gender = actor.gender == 1 ? "Female" : "Male"
        let popularity = String(format: "%.2f", actor.popularity)

        guard let profilePath = actor.profilePath,
              let profileImage = URL(string: "https://image.tmdb.org/t/p/original\(profilePath)"),
              actor.knownFor.count > 0,
              let popularMovie = actor.knownFor[0].name else { return nil }

        return ActorViewModel(name: name, gender: gender, popularity: popularity, profileImage: profileImage, popularMovie: popularMovie)
    }
}
