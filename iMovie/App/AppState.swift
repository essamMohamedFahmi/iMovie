import Foundation

enum AppRoot {
    case lunching
    case authentication
    case home
}

class AppState: ObservableObject {

    // MARK: - Properties

    @Published var currentRoot: AppRoot = .lunching
}
