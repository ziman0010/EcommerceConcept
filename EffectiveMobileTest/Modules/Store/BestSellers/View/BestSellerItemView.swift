//
//  BestSellerItemView.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 05.12.2022.
//

import SwiftUI

struct BestSellerItemView: View {
    
    @ObservedObject var viewModel: BestSellerViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("White"))
                .cornerRadius(10)
            VStack (spacing: 5) {
                ZStack {
                    AsyncImage(url: URL(string: viewModel.imageUrlString)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        Rectangle()
                            .foregroundColor(Color("White"))
                    }
                    .frame(width: 170, height: 182)
                }

                HStack {
                    Text(viewModel.discountPrice)
                        .font(Font.appFont(size: 16, style: .medium))
                        .foregroundColor(Color("Black"))
                    Text(viewModel.priceWithoutDiscount)
                        .font(Font.appFont(size: 10, style: .regular))
                        .foregroundColor(Color("Gray"))
                        .strikethrough()
                        .offset(x: 0, y: 1)
                }
                Text(viewModel.title)
                    .font(Font.appFont(size: 10, style: .light))
                    .foregroundColor(Color("Black"))
            }
            VStack {
                HStack {
                    Spacer()
                    ZStack {
                        Circle()
                            .foregroundColor(Color("White"))
                            .shadow(color: Color("DarkBlack").opacity(0.15), radius: 6, x: 0, y: 0)
                            .frame(width: 25, height: 25)
                        Image(viewModel.isFavorite ? "filledFavorite" : "Favorite")
                            .foregroundColor(Color("Orange"))
                    }
                }
                Spacer()
            }
            .padding(.top, 6)
            .padding(.trailing, 15)
        }
        .frame(width: 181, height: 227)
    }
}

struct BestSellerItemView_Previews: PreviewProvider {
    static var previews: some View {
        BestSellerItemView(viewModel: BestSellerViewModel(model: BestSellerModel(id: 1, isFavorite: true, title: "uioiuio", priceWithoutDiscount: 100, discountPrice: 200, imageUrl: "https://shop.gadgetufa.ru/images/upload/52534-smartfon-samsung-galaxy-s20-ultra-12-128-chernyj_1024.jpg")))
    }
}
