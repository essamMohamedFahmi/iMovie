import SwiftUI

struct StarsView: View {

    // MARK: - Private Properties

    private static let maxRating: Float = 5
    private static let color = Color.iMovieRose

    private let fullCount: Int
    private let emptyCount: Int
    private let halfFullCount: Int

    private let rating: Float
    private let size: CGFloat

    // MARK: - View Components

    private var fullStar: some View {
        Image(systemName: "star.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(StarsView.color)
            .frame(width: size, height: size)
    }

    private var halfFullStar: some View {
        Image(systemName: "star.lefthalf.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(StarsView.color)
            .frame(width: size, height: size)
    }

    private var emptyStar: some View {
        Image(systemName: "star")
            .resizable()
            .scaledToFit()
            .foregroundColor(StarsView.color)
            .frame(width: size, height: size)
    }

    // MARK: - Init

    init(rating: Float, size: CGFloat) {
        self.rating = rating
        self.size = size

        fullCount = Int(rating)
        emptyCount = Int(StarsView.maxRating - rating)
        halfFullCount = (Float(fullCount + emptyCount) < StarsView.maxRating) ? 1 : 0
    }

    // MARK:- Body

    var body: some View {
        HStack(spacing: 2) {
            ForEach(0 ..< fullCount) { _ in
                self.fullStar
            }
            ForEach(0 ..< halfFullCount) { _ in
                self.halfFullStar
            }
            ForEach(0 ..< emptyCount) { _ in
                self.emptyStar
            }
        }
    }
}
