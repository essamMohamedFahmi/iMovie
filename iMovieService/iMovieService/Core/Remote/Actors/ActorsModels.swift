import Foundation

// MARK: - ActorsResponse

public struct ActorsResponse: Codable {
    let page: Int
    let results: [Actor]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Actor

public struct Actor: Codable {
    let adult: Bool
    let gender, id: Int
    let knownFor: [KnownFor]
    let knownForDepartment: KnownForDepartment
    let name: String
    let popularity: Double
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownFor = "known_for"
        case knownForDepartment = "known_for_department"
        case name, popularity
        case profilePath = "profile_path"
    }
}

// MARK: - KnownFor

public struct KnownFor: Codable {
    let backdropPath, firstAirDate: String?
    let genreIDS: [Int]
    let id: Int
    let mediaType: MediaType
    let name: String?
    let originCountry: [String]?
    let originalLanguage: OriginalLanguage
    let originalName: String?
    let overview, posterPath: String
    let voteAverage: Double
    let voteCount: Int
    let adult: Bool?
    let originalTitle, releaseDate, title: String?
    let video: Bool?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIDS = "genre_ids"
        case id
        case mediaType = "media_type"
        case name
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case adult
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case title, video
    }
}

public enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

public enum OriginalLanguage: String, Codable {
    case en = "en"
    case te = "te"
}

public enum KnownForDepartment: String, Codable {
    case acting = "Acting"
    case writing = "Writing"
}
