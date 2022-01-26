import SwiftUI

struct TabBarIcon: View {

    // MARK: - Properties

    @StateObject var pageRouter: PageRouter

    let systemIconName: String
    var page: HomePage

    // MARK: - Body

    var body: some View {
        VStack {
            LinearGradient(
                colors: pageRouter.currentPage == page
                    ? [Color.iMovieRose, Color.iMovieBlue] : [Color.gray], startPoint: .leading,
                endPoint: .top
            )
            .mask(Image(systemName: systemIconName))
            .frame(width: 30, height: 30)
            .aspectRatio(contentMode: .fit)
            .padding()
        }
        .onTapGesture {
            pageRouter.currentPage = page
        }
        .padding(.horizontal, -4)
    }
}
