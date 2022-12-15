//
//  Scroll View + Extension.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 15.12.2022.
//

import SwiftUI

extension View {
    
    @ViewBuilder func scrollEnabled(_ enabled: Bool) -> some View {
        
        if enabled {
            self
        } else {
            simultaneousGesture(DragGesture(minimumDistance: 0),
                                including: .all)
        }
    }
}
