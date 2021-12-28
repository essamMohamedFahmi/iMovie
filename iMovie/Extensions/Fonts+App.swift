//
//  Fonts+App.swift
//  iMovie
//
//  Created by MorsyElsokary on 28/12/2021.
//

import SwiftUI

extension Font {
    
    // MARK: - Methods
    
    static func iMovieBold(_ size: CGFloat) -> Font {
        Font.custom("Poppins Bold", size: size)
    }

    static func iMovieMedium(_ size: CGFloat) -> Font {
        Font.custom("Poppins Medium", size: size)
    }

    static func iMovieRegular(_ size: CGFloat) -> Font {
        Font.custom("Poppins Regular", size: size)
    }

    static func iMovieLight(_ size: CGFloat) -> Font {
        Font.custom("Poppins Light", size: size)
    }

    static func iMovieArt(_ size: CGFloat) -> Font {
        Font.custom("Art Brewery", size: size)
    }

    static func iMovieVonique(_ size: CGFloat) -> Font {
        Font.custom("Vonique 64", size: size)
    }

    static func iMovieDaniel(_ size: CGFloat) -> Font {
        Font.custom("Daniel Davis", size: size)
    }
}
