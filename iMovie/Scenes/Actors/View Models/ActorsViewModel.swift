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
            .sink(receiveCompletion: onReceive, receiveValue: onReceive)
            .store(in: &cancellableSet)
    }

    // MARK: - Private Methods

    private func onReceive(_ completion: Subscribers.Completion<NetworkError>) {
        if case let .failure(error) = completion {
            errorMessage = error.localizedDescription
        }
    }

    private func onReceive(_ response: ActorsResponse) {
        actors = response.results.compactMap { ActorViewModel.build(from: $0) }
    }
}
