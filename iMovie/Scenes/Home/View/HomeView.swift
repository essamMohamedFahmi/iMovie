//
//  HomeView.swift
//  iMovie
//
//  Created by MorsyElsokary on 09/01/2022.
//

import SwiftUI

struct HomeView: View {

    // MARK: - Properties

    @StateObject var pageRouter = PageRouter(currentPage: .movies)

    // MARK: - Body

    var body: some View {
        ZStack {
            BackgroundView()

            GeometryReader { geometry in
                VStack {
                    Spacer()

                    currentPage()

                    Spacer()

                    tabBar(geometry: geometry)
                }
            }
        }
    }

    // MARK: - Private Methods

    @ViewBuilder
    private func currentPage() -> some View {
        switch pageRouter.currentPage {
        case .movies:
            MoviesView()

        case .actors:
            ActorsView()

        case .search:
            Text("Search")
                .font(.iMovieBold(40))
                .foregroundColor(.iMovieRose)
        }
    }

    @ViewBuilder
    private func tabBar(geometry: GeometryProxy) -> some View {
        HStack {
            TabBarIcon(
                pageRouter: pageRouter, width: geometry.size.width / 4,
                height: geometry.size.height / 28, systemIconName: "film", page: .movies)

            Spacer()

            TabBarIcon(
                pageRouter: pageRouter, width: geometry.size.width / 4,
                height: geometry.size.height / 28, systemIconName: "person.3", page: .actors)

            Spacer()

            TabBarIcon(
                pageRouter: pageRouter, width: geometry.size.width / 4,
                height: geometry.size.height / 28, systemIconName: "magnifyingglass", page: .search)
        }
        .frame(width: geometry.size.width, height: geometry.size.height / 13)
        .background(.clear)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
