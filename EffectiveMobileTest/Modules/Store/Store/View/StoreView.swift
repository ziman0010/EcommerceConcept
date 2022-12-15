//
//  StoreView.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 02.12.2022.
//

import SwiftUI

struct StoreView: View {
    
    @State var isFilterShow: Bool = false
    @State var selectedIndex = 0
    
    @EnvironmentObject private var navigation: NavigationStack
    @ObservedObject private var viewModel = StoreViewModel()
    
    var body: some View {
        ZStack {
            ScrollView (.vertical, showsIndicators: false) {
                VStack {
                    header
                    category
                    search
                    sales
                    bestSeller
                    Spacer()
                }
            }
            .scrollEnabled(!isFilterShow)
            .background(Color("DarkWhite"))
            VStack {
                Spacer()
                menu
            }
            .ignoresSafeArea()
            if isFilterShow {
                VStack {
                    Spacer()
                    FilterView(exitAction: {
                        isFilterShow.toggle()
                    })
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
    
    private var header: some View {
        HStack {
            Spacer()
            Image("Location")
            Text("Zihuatanejo, Gro")
                .font(Font.appFont(size: 15, style: .regular))
                .foregroundColor(Color("Black"))
            Image("DownArrow")
            Spacer()
            Button(action: {
                isFilterShow.toggle()
            }, label: {
                Image("Filter")
            })
        }
        .padding([.horizontal], 35)
    }
    
    private var category: some View {
        VStack(spacing: 24){
            HStack {
                Text("Select Category")
                    .font(Font.appFont(size: 25, style: .medium))
                    .foregroundColor(Color("Black"))
                Spacer()
                Text("view all")
                    .font(Font.appFont(size: 15, style: .light))
                    .foregroundColor(Color("Orange"))
            }
            .padding(.leading, 17)
            .padding(.trailing, 33)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (spacing: 23) {
                    CategoryItemView(title: "Phones", isSelectedIndex: selectedIndex, index: 0)
                        .onTapGesture {
                            selectedIndex = 0
                        }
                    CategoryItemView(title: "Computer", isSelectedIndex: selectedIndex, index: 1)
                        .onTapGesture {
                            selectedIndex = 1
                        }
                    CategoryItemView(title: "Health", isSelectedIndex: selectedIndex, index: 2)
                        .onTapGesture {
                            selectedIndex = 2
                        }
                    CategoryItemView(title: "Books", isSelectedIndex: selectedIndex, index: 3)
                        .onTapGesture {
                            selectedIndex = 3
                        }
                    
                }
                .padding(.leading, 27)
                .padding(.bottom, 35)
            }
        }
    }
    
    private var search: some View {
        HStack (spacing: 11) {
            ZStack {
                Rectangle()
                    .foregroundColor(Color("White"))
                    .frame(height: 34)
                    .cornerRadius(50)
                    .shadow(color: Color("LightPurple").opacity(0.15), radius: 20, x: 0, y: 0)
                HStack (spacing: 20){
                    Image("Search")
                    Text("Search")
                        .font(Font.appFont(size: 12, style: .light))
                        .foregroundColor(Color("Black").opacity(0.5))
                    Spacer()
                }
                .padding(.leading, 24)
            }
            
            ZStack {
                Circle()
                    .foregroundColor(Color("Orange"))
                    .frame(width: 34, height: 34)
                    .shadow(color: Color("LightPurple").opacity(0.15), radius: 20, x: 0, y: 0)
                Image("QR")
            }
        }
        .padding(.leading, 32)
        .padding(.trailing, 37)
    }
    
    private var sales: some View {
        VStack {
            HStack {
                Text("Hot sales")
                    .font(Font.appFont(size: 25, style: .medium))
                    .foregroundColor(Color("Black"))
                Spacer()
                Text("see more")
                    .font(Font.appFont(size: 15, style: .light))
                    .foregroundColor(Color("Orange"))
            }
            .padding(.leading, 17)
            .padding(.trailing, 33)
            
            StoreCarouselView(models: viewModel.hotSaleModels)
                .padding(.leading, 15)
                .padding(.trailing, 21)
                .frame(height: 182)
        }
    }
    
    private var bestSeller: some View {
        VStack {
            HStack {
                Text("Best Sellers")
                    .font(Font.appFont(size: 25, style: .medium))
                    .foregroundColor(Color("Black"))
                Spacer()
                Text("see more")
                    .font(Font.appFont(size: 15, style: .light))
                    .foregroundColor(Color("Orange"))
            }
            .padding(.leading, 17)
            .padding(.trailing, 27)
            BestSellerCollectionView(models: viewModel.bestSellerModels)
        }
        .padding(.bottom, 40)
    }
    
    private var menu: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("Black"))
                .cornerRadius(30)
            HStack (spacing: 52) {
                HStack {
                    Circle()
                        .frame(width: 8)
                    Text("Explorer")
                        .font(Font.appFont(size: 15, style: .medium))
                }
                Button {
                    navigation.push(.cartView)
                } label: {
                    ZStack {
                        Image("Cart")
                        VStack{
                            HStack {
                                Spacer()
                                Text(viewModel.cartCount)
                                    .font(Font.appFont(size: 12, style: .medium))
                                    .foregroundColor(Color("White"))
                                    .padding(4)
                                    .background(Circle()
                                                    .foregroundColor(Color("Orange")))
                                    .hidden(Int(viewModel.cartCount) == 0)
                            }
                            Spacer()
                        }
                    }
                }
                .frame(width: 25, height: 17)
                Image("Favorite")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 17)
                Image("Profile")
            }
            .foregroundColor(Color("White"))
        }
        .frame(height: 72)
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
