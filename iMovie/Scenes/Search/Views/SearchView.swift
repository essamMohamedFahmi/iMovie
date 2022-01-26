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

    // MARK: - View Components

    private var searchBar: some View {
        FancyTextField(text: $searchViewModel.searchText, textColor: .white, textSize: 17, spacing: 5, textTopBottomPadding: 10, placeholder: "Search...", placeholderTextColor: .gray, leftImageName: "magnifyingglass", leftImageColor: .gray, leftImagePadding: 20, borderWidth: 2, enableMatching: true)
            .padding(.top, 30)
            .padding(.bottom, 5)
            .padding([.leading, .trailing], 30)
    }

    // MARK: - Body

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                NavigationBarView(title: "Search")
                    .padding(.horizontal, 15)
                    .background(.clear)

                searchBar

                List(searchViewModel.movies) {
                    SearchMovieCardView(movieViewModel: $0)
                        .listRowBackground(Color.clear)
                        .frame(height: 120)
                        .padding(.bottom, 20)
                }

                Spacer()
            }

            if searchViewModel.isSearching {
                LoadingCircle(width: 30, height: 30, color: .iMovieBlue)
            }
        }
        .onTapGesture {
            endEditing()
        }
    }

    // MARK: - Private Methods

    private func endEditing() {
        UIApplication.shared.endEditing()
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
