//
//  CartView.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 08.12.2022.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject private var navigation: NavigationStack
    
    @ObservedObject var viewModel = CartViewModel()
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            header
            title
            cart
        }
    }
    
    private var header: some View {
        CartNavigationView(
            backAction: {
                self.navigation.unwind()
        },
            addressAction: {
            
        })
    }
    
    private var title: some View {
        Text("My Cart")
            .font(Font.appFont(size: 35, style: .medium))
            .foregroundColor(Color("Black"))
            .padding(.top, 50)
            .padding(.leading, 42)
    }
    
    private var cart: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("Black"))
                .cornerRadius(30)
                .ignoresSafeArea(edges: .bottom)
            VStack {
                ScrollView {
                    VStack (spacing: 45) {
                        ForEach(viewModel.cart) { model in
                            CartItemView(model: model)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 33)
                    .padding(.top, 80)
                }
                Divider()
                    .overlay(Color("White").opacity(0.25))
                HStack {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Total")
                        Text("Delivery")
                    }
                    .font(Font.appFont(size: 15, style: .light))
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(viewModel.total)
                        Text(viewModel.delivery)
                    }
                    .font(Font.appFont(size: 15, style: .medium))
                }
                .foregroundColor(Color("White"))
                .padding(.top, 15)
                .padding(.leading, 55)
                .padding(.trailing, 30)
                .padding(.bottom, 26)
                Divider()
                    .overlay(Color("White").opacity(0.25))
                Spacer()
                
                Text("Checkout")
                    .font(Font.appFont(size: 20, style: .medium))
                    .foregroundColor(Color("White"))
                    .padding(.horizontal, 118)
                    .padding(.vertical, 15)
                    .background(Color("Orange"))
                    .cornerRadius(10)
            }
        }
        .padding(.top, 49)
    }
    
    struct CartViewPreview: PreviewProvider {
        
        static var previews: some View {
            CartView(viewModel: CartViewModel())
        }
    }
}
