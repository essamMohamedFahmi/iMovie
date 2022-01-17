//
//  ActorsView.swift
//  iMovie
//
//  Created by Essam Fahmi on 15/01/2022.
//

import Combine
import SwiftUI

struct ActorsView: View {

    // MARK: - Properties

    @ObservedObject private var actorsViewModel = ActorsViewModel()

    // MARK: - Init

    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }

    // MARK: - Body

    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView(title: "Actors")
                .padding(.horizontal, 15)
                .background(.clear)

            List(actorsViewModel.actors) {
                ActorView(actorViewModel: $0)
                    .listRowBackground(Color.clear)
                    .frame(height: 150)
            }

            Spacer()
        }
        .present(isPresented: $actorsViewModel.error, type: .toast, position: .top) {
            self.createToast(with: actorsViewModel.errorMessage)
        }
        .onAppear {
            self.actorsViewModel.fetchActors()
        }
    }

    // MARK: - Methods

    func createToast(with message: String) -> some View {
        VStack {
            Spacer()

            HStack {
                Text(message)
                    .font(.iMovieRegular(14))
                    .foregroundColor(.white)
                    .padding()

                Spacer()
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 85)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.iMovieBlue, Color.iMoviePurpure]),
                startPoint: .leading,
                endPoint: .trailing)
        )
    }
}

struct ActorsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            ActorsView()
        }
    }
}
