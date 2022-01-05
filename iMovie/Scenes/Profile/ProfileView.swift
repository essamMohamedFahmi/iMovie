//
//  ProfileView.swift
//  iMovie
//
//  Created by MorsyElsokary on 26/12/2021.
//

import SwiftUI

struct ProfileView: View {
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                VStack(alignment: .leading) {
                    ProfileInfo(profileImage: "ProfilePicDemo", profileName: "Morsy Elsokary", profileCaption: "Type what in your Mind...?", profileFollowersCount: 420, profileFollowingCount: 1992)
                        .padding(.bottom, 10)
                    
                    ScrollView(.vertical) {
                        ProfileSegmentOne()

                        ProfileSegmentTwo()
                        
                        ProfileSegmentThree()
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

// MARK: - Preview

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

// MARK: - Background

struct BackgroundView: View {
    var body: some View {
        Group {
            Image("BG")
                .resizable()
            
            LinearGradient(gradient: Gradient(colors: [Color.iMovieDarkBlue, Color.iMovieBlue]), startPoint: .top, endPoint: .bottom)
                .opacity(0.7)
            
            VisualEffectView(effect: UIBlurEffect(style: .dark))
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

// MARK: - Profile Info

struct ProfileInfo: View {
    
    var profileImage: String
    var profileName: String
    var profileCaption: String
    var profileFollowersCount: Int
    var profileFollowingCount: Int
    
    var body: some View {
        HStack(spacing: 30) {
            Image(profileImage)
                .resizable()
                .frame(width: 130, height: 130)
                .cornerRadius(20)
                .padding(.leading, 20)
            
            VStack(alignment: .leading, spacing:40) {
                VStack(alignment: .leading, spacing:10) {
                    Text(profileName)
                        .font(.iMovieMedium(20))
                        .foregroundColor(.white)
                    
                    Text(profileCaption)
                        .font(.iMovieRegular(15))
                        .foregroundColor(Color.iMovieRose)
                }
                
                HStack(spacing: 10) {
                    VStack(alignment: .leading, spacing:10) {
                        Text("\(profileFollowersCount)")
                            .foregroundColor(.white)
                        
                        Text("Followers")
                            .foregroundColor(.white)
                            .font(.iMovieLight(10))
                    }
                    
                    VStack(alignment: .leading, spacing: 10)  {
                        Text("\(profileFollowingCount)")
                            .foregroundColor(.white)
                        
                        Text("Following")
                            .foregroundColor(.white)
                            .font(.iMovieLight(10))
                    }
                }
            }
            .padding(.trailing, 20)
        }
    }
}

// MARK: - Profile Segment One

struct ProfileSegmentOne: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.black
                .opacity(0.3)
            
            VStack(alignment: .leading, spacing: 10) {
                Button("Your Favorite") {}
                
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 2)
                    .opacity(0.5)
                
                Button("Share Your Profile") {}
                
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 2)
                    .opacity(0.5)
                
                Button("Rate Us") {}
            }
            .modifier(SegmentModifier())
        }
        .frame(height: 150)
    }
}

// MARK: - Profile Segment Two

struct ProfileSegmentTwo: View {
    
    @State var profileIsHidden: Bool = true
    @State var notices: Bool = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.black
                .opacity(0.3)
            
            VStack(alignment: .leading, spacing: 10) {
                Toggle(isOn: $profileIsHidden) {
                    Text("Hide your Profile")
                }
                .tint(.iMovieRose)
                
                Toggle(isOn: $notices) {
                    Text("Notices")
                }
                .tint(.iMovieRose)
            }
            .modifier(SegmentModifier())
        }
        .frame(height: 100)
    }
}

// MARK: - Profile Segment Three

struct ProfileSegmentThree: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.black
                .opacity(0.3)
            
            VStack(alignment: .leading, spacing: 10) {
                Button("Settings"){}
                
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 2)
                    .opacity(0.5)
                
                Button("About Us"){}
            }
            .modifier(SegmentModifier())
        }
        .frame(height: 100)
    }
}

struct SegmentModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.iMovieMedium(20))
            .foregroundColor(.white)
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 20)
    }
}
