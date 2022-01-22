import SwiftUI

enum MovieCategory: String, CaseIterable {
    case popural
    case new
    case soon
    case trailer

    var text: String {
        self.rawValue.uppercased()
    }
}

struct CategoryPickerView: View {

    // MARK: - Properties

    @State private var contentType: MovieCategory = .popural

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack(spacing: 15) {
                ForEach(MovieCategory.allCases, id: \.self) { type in
                    PickerSelector(title: type.text, isSelected: contentType == type)
                        .onTapGesture {
                            contentType = type
                        }
                }
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)

            currentSelector()
        }
        .background(.clear)
    }

    // MARK: - Private Methods

    @ViewBuilder
    private func currentSelector() -> some View {
        switch contentType {
        case .popural:
            displayContent()

        case .new:
            displayContent()

        case .soon:
            displayContent()

        case .trailer:
            displayContent()
        }
    }

    @ViewBuilder
    private func displayContent() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(0...10, id: \.self) { card in
                    iMovieCardView(
                        moviePoster: "MoviePoster",
                        movieTitle: "The good doctor",
                        movieReleaseDate: "Jan 26, 2017",
                        rateColor: .iMoviePurpure, rate: 0.75)
                }
            }
            .padding([.bottom, .leading], 10)
        }
    }
}

struct iMoviePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            CategoryPickerView()
        }
    }
}

struct PickerSelector: View {

    // MARK: - Properties

    var title: String
    var isSelected: Bool = false

    // MARK: - Body

    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Text(title)
                .font(.iMovieBold(15))
                .foregroundColor(isSelected ? .iMovieBlue : .gray)

            Rectangle()
                .frame(height: 2, alignment: .center)
                .foregroundColor(.iMovieBlue)
                .foregroundColor(isSelected ? .iMovieBlue : .gray)
                .opacity(isSelected ? 1 : 0)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}
