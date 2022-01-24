import SwiftUI

struct LoadingCircle: View {

    var width: CGFloat
    var height: CGFloat
    var color: Color

    @State private var isLoading = false

    var body: some View {
        Circle()
            .trim(from: 0, to: 0.75)
            .stroke(color, lineWidth: 3)
            .frame(width: width, height: height)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(Animation.linear(duration: 0.5)
                        .repeatForever(autoreverses: false))
            .onAppear() {
                self.isLoading = true
            }
    }
}
