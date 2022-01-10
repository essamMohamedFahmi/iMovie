//
//  MoviesView.swift
//  iMovie
//
//  Created by MorsyElsokary on 08/01/2022.
//

import SwiftUI

struct MoviesView: View {

    // MARK: - Body

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                NavigationBarView()
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
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
