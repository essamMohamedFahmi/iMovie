import Combine
import Foundation
import iMovieService

class SearchViewModel: ObservableObject {

    // MARK: - Input Properties

    @Published var searchText = ""

    // MARK: - Output Properties

    @Published var movies: [MovieViewModel] = []
    @Published var errorMessage = ""
    @Published var error = false
    @Published var isSearching = false

    // MARK: - Properties

    private var cancellableSet: Set<AnyCancellable> = []
    private var service: SearchServiceable

    // MARK: - Init

    init(service: SearchServiceable = SearchService()) {
        self.service = service
        bind()
    }

    // MARK: - Methods

    func bind() {
        $errorMessage
            .receive(on: RunLoop.main)
            .map { !$0.isEmpty }
            .assign(to: \.error, on: self)
            .store(in: &cancellableSet)

        $searchText
            .sink(receiveValue: { [weak self] query in
                guard !query.isEmpty else {
                    self?.movies = []
                    return
                }

                self?.search(query)
            })
            .store(in: &cancellableSet)
    }

    // MARK: - Private Methods

    private func search(_ query: String) {
        isSearching = true
        service.searchMovies(query: query)
            .sink(receiveCompletion: onReceive, receiveValue: onReceive)
            .store(in: &cancellableSet)
    }

    private func onReceive(_ completion: Subscribers.Completion<NetworkError>) {
        isSearching = false
        if case let .failure(error) = completion {
            errorMessage = error.localizedDescription
        }
    }

    private func onReceive(_ response: SearchResponse) {
        isSearching = false
        movies = response.results.compactMap { MovieViewModel.build(from: $0) }
    }
}
