//
//  HomeView.swift
//  iMovie
//
//  Created by MorsyElsokary on 09/01/2022.
//

import SwiftUI

struct HomeView: View {

    //MARK: - Properties
    
    @StateObject var viewRouter: ViewRouter

    //MARK: - Body
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                switch viewRouter.currentView {
                case .movie:
                    Text("Movie")
                        .font(.iMovieBold(40))
                        .foregroundColor(.iMovieRose)
                    
                case .actros:
                    Text("Actors")
                        .font(.iMovieBold(40))
                        .foregroundColor(.iMovieRose)
                    
                case .search:
                    Text("Search")
                        .font(.iMovieBold(40))
                        .foregroundColor(.iMovieRose)
                }

                Spacer()

                HStack {
                    TabBarIcon(viewRouter: viewRouter,
                        width: geometry.size.width / 4, height: geometry.size.height / 28,
                               systemIconName: "film", assignedPage: .movie)
                    Spacer()
                    
                    TabBarIcon(viewRouter: viewRouter,
                        width: geometry.size.width / 4, height: geometry.size.height / 28,
                               systemIconName: "person.3", assignedPage: .actros)
                    
                    Spacer()

                    TabBarIcon(viewRouter: viewRouter,
                        width: geometry.size.width / 4, height: geometry.size.height / 28,
                               systemIconName: "magnifyingglass", assignedPage: .search)
                }
                .frame(width: geometry.size.width, height: geometry.size.height / 10)
                .background(.clear)
            }
            .edgesIgnoringSafeArea(.bottom)

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            
            HomeView(viewRouter: ViewRouter())
        }
    }
}

struct TabBarIcon: View {

    //MARK: - Properties
    
    @StateObject var viewRouter: ViewRouter

    let width: CGFloat
    let height: CGFloat
    let systemIconName: String
    var assignedPage: Views

    //MARK: - Body

    var body: some View {
        VStack {
            LinearGradient(
                gradient: Gradient(colors: viewRouter.currentView == assignedPage ? [Color.iMovieRose, Color.iMovieRose,Color.iMovieRose , Color.iMovieBlue] : [Color.gray , Color.gray] ),
                startPoint: .leading,
                endPoint: .top
            )
            .mask(Image(systemName: systemIconName))
            .frame(width: width, height: height)
            .aspectRatio(contentMode: .fit)
            .padding()
        }
        .onTapGesture {
            viewRouter.currentView = self.assignedPage
        }
        .padding(.horizontal, -4)
    }
}
