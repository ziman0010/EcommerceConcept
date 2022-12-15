//
//  CartNavigationView.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 08.12.2022.
//

import SwiftUI

struct CartNavigationView: View {
    var backAction: () -> Void
    var addressAction: () -> Void

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
            Text("Add address")
                .lineLimit(1)
                .font(Font.appFont(size: 15, style: .regular))
            Button(action: addressAction) {
                Image("Location")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14)
                    .foregroundColor(Color("White"))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .background(Color("Orange"))
                    .cornerRadius(10)
            }
        }
        .padding(.leading, 42)
        .padding(.trailing, 35)
    }
}

struct CartNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CartNavigationView(backAction: {}, addressAction: {})
    }
}
