//
//  RatingCircleView.swift
//  iMovie
//
//  Created by MorsyElsokary on 04/01/2022.
//

import SwiftUI

struct RatingCircle: View {
    
    // MARK: - Properties
    
    @State private var isLoading = false
    @State private var progress: CGFloat = 0.86
    
    var rateColor: Color
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.black)
                .frame(width: 60, height: 60)
            
            HStack(spacing: 0) {
                Text("\(Int(progress * 100))")
                    .font(.iMovieBold(15))
                    .foregroundColor(.white)
                    .overlay(
                        Text("%")
                            .font(.system(size: 10, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .offset(x: 12, y: -6))
            }
            .padding()
            
            Circle()
                .stroke(rateColor.opacity(0.6), lineWidth: 5)
                .frame(width: 50, height: 50)
            
            Circle()
                .trim(from: 0, to: isLoading ? progress : 0)
                .stroke(rateColor, lineWidth: 3)
                .frame(width: 50, height: 50)
                .rotationEffect(Angle(degrees: -90))
                .animation(Animation.default.delay(1.0), value: isLoading)
        }
        .onAppear {
            isLoading.toggle()
        }
    }
}


struct RatingCircleView_Previews: PreviewProvider {
    static var previews: some View {
        RatingCircle(rateColor: .green)
    }
}
