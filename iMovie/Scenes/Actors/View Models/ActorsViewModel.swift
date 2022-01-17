import Combine
import Foundation
import iMovieService

class ActorsViewModel: ObservableObject {

    // MARK: - Output Properties

    @Published var actors: [ActorViewModel] = []
    @Published var errorMessage = ""
    @Published var error = false

    // MARK: - Properties

    private var cancellableSet: Set<AnyCancellable> = []
    private var service: ActorsServiceable

    // MARK: - Init

    init(service: ActorsServiceable = ActorsService()) {
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

    func fetchActors() {
        service.getActors()
            .sink { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] response in
                self?.actors = response.actors
                    .compactMap { ActorViewModel.build(from: $0) }
            }
            .store(in: &cancellableSet)
    }
}
