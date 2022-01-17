import Foundation

// MARK: - ActorsResponse

public struct ActorsResponse: Codable {
    public let page: Int
    public let actors: [Actor]
    public let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case actors = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Actor

public struct Actor: Codable {
    public let adult: Bool
    public let gender, id: Int
    public let knownFor: [KnownFor]
    public let knownForDepartment: KnownForDepartment
    public let name: String
    public let popularity: Double
    public let profilePath: String?

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
    public let backdropPath, firstAirDate: String?
    public let genreIDS: [Int]
    public let id: Int
    public let mediaType: MediaType
    public let name: String?
    public let originCountry: [String]?
    public let originalLanguage: OriginalLanguage
    public let originalName: String?
    public let overview, posterPath: String
    public let voteAverage: Double
    public let voteCount: Int
    public let adult: Bool?
    public let originalTitle, releaseDate, title: String?
    public let video: Bool?

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
