//
//  MoviesView.swift
//  iMovie
//
//  Created by MorsyElsokary on 08/01/2022.
//

import SwiftUI

struct MoviesView: View {

    // MARK: - Private Methods

    private func topSafeAreaInsets() -> CGFloat {
        guard let key = UIApplication.shared.windows.first?.safeAreaInsets.top else { return 5.0 }

        return key + 10.0
    }

    // MARK: - Body

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                NavigationBarView()
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .padding(.top, topSafeAreaInsets())
                    .background(.clear)

                Spacer()

                ContentPickerView()
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}
struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
