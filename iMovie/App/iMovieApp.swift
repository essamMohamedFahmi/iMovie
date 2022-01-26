import SwiftUI

@main
struct iMovieApp: App {

    // MARK: - Properties

    @StateObject var appState = AppState()

    // MARK: - Body

    var body: some Scene {
        WindowGroup {
            switch appState.currentRoot {
            case .lunching:
                SplashView().environmentObject(appState)
            case .authentication:
                LoginView().environmentObject(appState)
            case .home:
                HomeView().environmentObject(appState)
            }
        }
    }
}
