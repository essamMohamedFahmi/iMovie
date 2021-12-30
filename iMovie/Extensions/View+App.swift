//
//  View+App.swift
//  iMovie
//
//  Created by MorsyElsokary on 30/12/2021.
//

import SwiftUI

extension View {
    
    //MARK: - Methods
    
    func segmentStyle() -> some View {
        self.modifier(SegmentModifier())
    }
}
