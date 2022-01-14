//
//  TabBarIcon.swift
//  iMovie
//
//  Created by Essam Fahmi on 10/01/2022.
//

import SwiftUI

struct TabBarIcon: View {

    // MARK: - Properties

    @StateObject var pageRouter: PageRouter

    let width: CGFloat
    let height: CGFloat
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
            .frame(width: width, height: height)
            .aspectRatio(contentMode: .fit)
            .padding()
        }
        .onTapGesture {
            pageRouter.currentPage = page
        }
        .padding(.horizontal, -4)
    }
}
