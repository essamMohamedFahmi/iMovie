//
//  HomeView.swift
//  iMovie
//
//  Created by MorsyElsokary on 09/01/2022.
//

import SwiftUI

struct HomeView: View {

    // MARK: - Properties

    @EnvironmentObject var appState: AppState
    @StateObject var pageRouter = PageRouter(currentPage: .movies)

    // MARK: - View Components

    var tabBar: some View {
        HStack {
            TabBarIcon(pageRouter: pageRouter, systemIconName: "film", page: .movies)

            Spacer()

            TabBarIcon(pageRouter: pageRouter, systemIconName: "person.3", page: .actors)

            Spacer()

            TabBarIcon(pageRouter: pageRouter, systemIconName: "magnifyingglass", page: .search)
        }
        .frame(height: 30)
        .padding([.trailing, .leading], 20)
        .background(.clear)
    }

    // MARK: - Body

    var body: some View {
        ZStack {
            BackgroundView()

            VStack {
                Spacer()

                currentPage()

                Spacer()

                tabBar
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
            SearchView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
