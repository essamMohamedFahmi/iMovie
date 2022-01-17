import SDWebImageSwiftUI
import SwiftUI

struct URLImage: View {

    // MARK: - Properties

    var url: URL

    // MARK: - Body

    var body: some View {
        WebImage(url: url)
            .resizable()
            .scaledToFit()
    }
}
