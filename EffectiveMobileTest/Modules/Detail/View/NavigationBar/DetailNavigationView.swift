//
//  DetailNavigationView.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 07.12.2022.
//

import SwiftUI

struct DetailNavigationView: View {
    
    var backAction: () -> Void
    var cartAction: () -> Void

    var body: some View {
        HStack {
            Button(action: backAction) {
                Image("LeftArrow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 7, height: 14)
                    .foregroundColor(Color("White"))
                    .padding(.horizontal, 13)
                    .padding(.vertical, 10)
                    .background(Color("Black"))
                    .cornerRadius(10)
            }
            Spacer()
            Text("Product Details")
                .lineLimit(1)
                .font(Font.appFont(size: 18, style: .regular))
            Spacer()
            Button(action: cartAction) {
                Image("Cart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14, height: 14)
                    .foregroundColor(Color("White"))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .background(Color("Orange"))
                    .cornerRadius(10)
            }
        }
        .padding(.leading, 42)
        .padding(.trailing, 35)
    }
}


struct DetailbView_Previews: PreviewProvider {
    static var previews: some View {
        DetailNavigationView(backAction: {}, cartAction: {})
    }
}
