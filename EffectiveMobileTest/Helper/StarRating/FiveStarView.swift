//
//  FiveStarView.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 14.12.2022.
//

import SwiftUI

struct FiveStarView: View {
    
    var rating: Decimal
    var color: Color
    var backgroundColor: Color

    init(
        rating: Decimal,
        color: Color = Color("Yellow"),
        backgroundColor: Color = Color("Gray")
    ) {
        self.rating = rating
        self.color = color
        self.backgroundColor = backgroundColor
    }

    var body: some View {
        ZStack {
            BackgroundStars(backgroundColor)
            ForegroundStars(rating: rating, color: color)
        }
    }
}


private struct StarImage: View {
    
    var body: some View {
        Star(rating: 1, color: Color("Gray"), index: 0)
    }
}


private struct BackgroundStars: View {
    var color: Color

    init(_ color: Color) {
        self.color = color
    }

    var body: some View {
        HStack (spacing: 9) {
            ForEach(0..<5) { _ in
                StarImage()
            }
        }.foregroundColor(color)
    }
}


private struct ForegroundStars: View {
    var rating: Decimal
    var color: Color

    init(rating: Decimal, color: Color) {
        self.rating = rating
        self.color = color
    }

    var body: some View {
        HStack (spacing: 9) {
            ForEach(0..<5) { index in
                Star(
                    rating: self.rating,
                    color: self.color,
                    index: index
                )
            }
        }
    }
}
