//
//  MovieView.swift
//  iMovie
//
//  Created by MorsyElsokary on 08/01/2022.
//

import SwiftUI

struct MovieView: View {

    //MARK: - Properties
    
  private let keyWindow = UIApplication.shared.windows.first?.safeAreaInsets.top

        //MARK: - Body
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(spacing: 0) {
                NavigationBarView()
                    .padding(.horizontal , 15)
                    .padding(.bottom)
                    .padding(.top, keyWindow)
                    .background(.clear)
                
                Spacer()
                
                iMoviePickerView()
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}
struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
