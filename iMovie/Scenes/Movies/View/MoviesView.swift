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
        VStack(spacing: 0) {
            NavigationBarView(title: "Movies")
                .padding(.horizontal, 15)
                .padding(.bottom)
                .background(.clear)

            Spacer()

            CategoryPickerView()
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            MoviesView()
        }
    }
}
