import SwiftUI

extension View {
    func placeholder(
        _ text: String,
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        padding: CGFloat = 20,
        color: Color = Color.white
    ) -> some View {
        placeholder(when: shouldShow, alignment: alignment) {
            Text(text)
                .foregroundColor(color)
                .padding([.trailing, .leading], padding)
        }
    }

    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
