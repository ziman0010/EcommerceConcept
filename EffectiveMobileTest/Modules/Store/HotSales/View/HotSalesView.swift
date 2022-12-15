//
//  HotSalesView.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 13.12.2022.
//

import SwiftUI

struct HotSalesView: View {
    
    @ObservedObject var viewModel: HotSaleViewModel
    
    var body: some View {
        ZStack (alignment: .leading) {
            Rectangle()
                .cornerRadius(10)
                .frame(height: 182)
            HStack {
                VStack (alignment: .leading ,spacing: 0) {
                    ZStack {
                        Circle()
                            .foregroundColor(Color("Orange"))
                            .frame(width: 27, height: 27)
                        Text("New")
                            .font(Font.appFont(size: 10, style: .medium))
                            .foregroundColor(Color("White"))
                    }
                    .hidden(!viewModel.isNew)
                    VStack (alignment: .leading ,spacing: 5) {
                        Text(viewModel.title)
                            .font(Font.appFont(size: 25, style: .medium))
                            .padding(.top, 18)
                            .fixedSize(horizontal: false, vertical: true)
                        Text(viewModel.subtitle)
                            .font(Font.appFont(size: 11, style: .light))
                    }
                    .foregroundColor(Color("White"))
                    
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("White"))
                            .cornerRadius(5)
                            .frame(width: 98, height: 23)
                        Text("Buy now!")
                            .font(Font.appFont(size: 11, style: .medium))
                    }
                    .hidden(!viewModel.isBuy)
                }
                .padding(.top, 14)
                .padding(.leading, 25)
                .padding(.bottom, 26)
                Spacer()
                AsyncImage(url: URL(string: viewModel.imageUrlString), content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                }, placeholder: {
                    Rectangle()
                })
                    .frame(width: 170, height: 182)
                    .clipped()
                    .padding(.trailing)
            }
        }
        .frame(height: 182)
    }
}

struct HotSalesView_Previews: PreviewProvider {
    static var previews: some View {
        HotSalesView(viewModel: HotSaleViewModel(model: HotSaleModel(id: 1, isNew: true, title: "iphone 12", subtitle: "the best", imageUrl: "https://img.ibxk.com.br/2020/09/23/23104013057475.jpg?w=1120&h=420&mode=crop&scale=both", isBuy: true)))
    }
}
