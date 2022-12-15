//
//  Star.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 14.12.2022.
//

import SwiftUI

struct Star: View {
    var rating: CGFloat
    var color: Color
    var index: Int
    
    
    var maskRatio: CGFloat {
        let mask = rating - CGFloat(index)
        
        switch mask {
        case 1...: return 1
        case ..<0: return 0
        default: return mask
        }
    }


    init(rating: Decimal, color: Color, index: Int) {
        self.rating = CGFloat(Double(rating.description) ?? 0)
        self.color = color
        self.index = index
    }


    var body: some View {
        GeometryReader { star in
            Image("Star")
                .foregroundColor(self.color)
                .frame(width: 18, height: 18)
                .mask(
                    Rectangle()
                        .size(
                            width: star.size.width * self.maskRatio,
                            height: star.size.height
                        )
                )
        }
    }
}
