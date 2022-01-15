//
//  ActorsView.swift
//  iMovie
//
//  Created by Essam Fahmi on 15/01/2022.
//

import SwiftUI

struct ActorsView: View {

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
