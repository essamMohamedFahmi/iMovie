import Combine
import Foundation
import iMovieService

class SearchViewModel: ObservableObject {

    // MARK: - Output Properties

    @Published var movies: [MovieViewModel] = []
    @Published var errorMessage = ""
    @Published var error = false

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
    }
}
