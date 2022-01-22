import Combine
import SwiftUI

struct SearchView: View {

    // MARK: - Properties

    @ObservedObject private var searchViewModel = SearchViewModel()

    // MARK: - Init

    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }

    // MARK: - Body

    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView(title: "Search")
                .padding(.horizontal, 15)
                .background(.clear)

            Spacer()
        }
        .present(isPresented: $searchViewModel.error, type: .toast, position: .top) {
            self.createToast(with: searchViewModel.errorMessage)
        }
        .onAppear {
            //
        }
    }

    // MARK: - Methods

    func createToast(with message: String) -> some View {
        VStack {
            Spacer()

            HStack {
                Text(message)
                    .font(.iMovieRegular(14))
                    .foregroundColor(.white)
                    .padding()

                Spacer()
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 85)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.iMovieBlue, Color.iMoviePurpure]),
                startPoint: .leading,
                endPoint: .trailing)
        )
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            SearchView()
        }
    }
}
