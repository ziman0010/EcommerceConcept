//
//  CategoryItemView.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 04.12.2022.
//

import SwiftUI

struct CategoryItemView: View {
    
    var title: String
    
    var isSelectedIndex: Int
    var index: Int
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(isSelectedIndex == index ? Color("Orange") : Color("White"))
                    .frame(width: 71, height: 71)
                    .shadow(color: Color("GrayPurple").opacity(0.15), radius: 20, x: 0, y: 0)
                Image(title)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(isSelectedIndex == index ? Color("White") : Color("Gray"))
                    .frame(width: 30, height: 30)
            }
            Text(title)
                .font(Font.appFont(size: 12, style: .regular))
                .foregroundColor(isSelectedIndex == index ? Color("Orange") : Color("Black"))
        }
    }
}
