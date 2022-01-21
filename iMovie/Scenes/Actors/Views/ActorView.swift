import SwiftUI

struct ActorView: View {

    // MARK: - Properties

    var actorViewModel: ActorViewModel

    // MARK: - View Components

    var profileImage: some View {
        URLImage(url: actorViewModel.profileImage)
            .frame(width: 80, height: 120)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(
                        Color(
                            .sRGB,
                            red: 150 / 255,
                            green: 150 / 255,
                            blue: 150 / 255,
                            opacity: 0.1), lineWidth: 1)
            )
            .padding(.leading, 20)
            .padding(.trailing, 15)
            .offset(x: 0, y: -25)
    }

    var nameText: some View {
        Text(actorViewModel.name)
            .font(.iMovieBold(15))
            .foregroundColor(.white)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
    }

    var genderText: some View {
        Text(actorViewModel.gender)
            .font(.iMovieRegular(15))
            .foregroundColor(.white)
    }

    var popularMovieText: some View {
        Text(actorViewModel.popularMovie)
            .font(.iMovieRegular(15))
            .minimumScaleFactor(0.5)
            .foregroundColor(.white)
    }

    var popularityText: some View {
        Text(actorViewModel.popularity)
            .font(.iMovieBold(15))
            .foregroundColor(.white)
            .padding(.top, 15)
            .padding(.trailing, 5)
    }

    // MARK: - Body

    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .frame(height: 100)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.iMovieBlue, Color.purple]),
                    startPoint: .leading,
                    endPoint: .trailing)
            )
            .cornerRadius(10)
            .overlay(
                HStack {
                    profileImage

                    HStack {
                        VStack(alignment: .leading) {
                            nameText
                            genderText
                            popularMovieText
                            Spacer()
                        }
                        .padding(.top, 15)

                        Spacer()

                        VStack {
                            popularityText
                            Spacer()
                        }
                    }

                    Spacer()
                }
            )
            .padding(.top, 35)
    }
}

struct ActorView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            ActorView(actorViewModel: ActorViewModel(name: "Test", gender: "Test", popularity: "123", profileImage: URL(string: "")!, popularMovie: "Test"))
        }
    }
}
