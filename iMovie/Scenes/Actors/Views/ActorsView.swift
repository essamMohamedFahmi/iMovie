//
//  ActorsView.swift
//  iMovie
//
//  Created by Essam Fahmi on 15/01/2022.
//

import Combine
import SwiftUI
import iMovieService

struct ActorsView: View {

    var subscriptions = Set<AnyCancellable>()

    // MARK: - Init

    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear

        let service = ActorsService()
        service.getActors()
            .sink { completion in
                switch completion {
                case let .failure(error):
                    print("oops got an error \(error.localizedDescription)")
                case .finished:
                    print("nothing much to do here")
                }
            } receiveValue: { response in
                print("got my response here \(response)")
            }
            .store(in: &subscriptions)
    }

    // MARK: - Body

    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView(title: "Actors")
                .padding(.horizontal, 15)
                .background(.clear)

            List {
                ActorView(
                    name: "Tom Holland", profile: "actor", popularMovie: "Avengers: Infinity War",
                    gender: "male", popularity: "145.03"
                )
                .listRowBackground(Color.clear)
                .frame(height: 150)

                ActorView(
                    name: "Tom Holland", profile: "actor", popularMovie: "Avengers: Infinity War",
                    gender: "male", popularity: "145.03"
                )
                .listRowBackground(Color.clear)
                .frame(height: 150)
            }

            Spacer()
        }
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
