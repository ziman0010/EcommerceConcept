//
//  CartItemView.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 08.12.2022.
//

import SwiftUI

struct CartItemView: View {
    
    @ObservedObject var viewModel: CartItemViewModel
    
    init(model: CartItemModel) {
        self.viewModel = CartItemViewModel(model: model)
    }
    var body: some View {
        HStack (spacing: 17 ) {
            AsyncImage(url: URL(string: viewModel.imageUrlString)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 88, height: 88)
                    .cornerRadius(10)
            } placeholder: {
                Rectangle()
                    .frame(width: 88, height: 88)
                    .foregroundColor(Color("White"))
                    .cornerRadius(10)
            }
            VStack (alignment: .leading) {
                Text(viewModel.title)
                    .lineLimit(2)
                    .foregroundColor(Color("White"))
                    .font(Font.appFont(size: 20, style: .medium))
                Text(viewModel.price)
                    .foregroundColor(Color("Orange"))
                    .font(Font.appFont(size: 20, style: .regular))
            }
            Spacer()
            VStack (spacing: 6) {
                Button {
                    viewModel.count = viewModel.count > 1 ? viewModel.count - 1 : viewModel.count
                } label: {
                    Image("Minus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 9)
                }
                .frame(height: 10)

                Text(String(viewModel.count))
                    .foregroundColor(Color("White"))
                    .font(Font.appFont(size: 20, style: .regular))
                Button {
                    viewModel.count += 1
                } label: {
                    Image("Plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 9)
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 9)
            .background(Rectangle()
                            .foregroundColor(Color("DeepBlue")))
            .cornerRadius(26)
            
            Button {
                
            } label: {
                Image("Delete")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 16)
            }

        }
        .background(Color("Black"))
    }
}
