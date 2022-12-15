//
//  DetailView.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 06.12.2022.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject private var navigation: NavigationStack
    
    @ObservedObject var viewModel = DetailViewModel()
    
    @State var isSelectedColor = 0
    @State var isSelectedCapacity = 0
    
    var body: some View {
        VStack {
            header
            carouselPreview
            description
            Spacer()
        }
        .background(Color("DarkWhite"))
        
    }
    private var header: some View {
        DetailNavigationView(backAction: {
            self.navigation.unwind()
        }, cartAction: {
            self.navigation.push(.cartView)
        })
    }
    
    private var carouselPreview: some View {
        DetailCarouselView(viewModels: viewModel.imagesUrlString)
    }
    
    private var description: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("White"))
                .cornerRadius(30)
                .ignoresSafeArea(edges: .bottom)
            VStack (alignment: .leading, spacing: 0) {
                title
                section
                specification
                variants
                cart
                Spacer()
            }
        }
    }
    
    private var title: some View {
        VStack (alignment: .leading, spacing: 7) {
            HStack {
                Text(viewModel.title)
                    .font(Font.appFont(size: 24, style: .regular))
                Spacer()
                Image(viewModel.isFavorite ? "filledFavorite" : "Favorite")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14, height: 13)
                    .foregroundColor(Color("White"))
                    .padding(.horizontal, 11)
                    .padding(.vertical, 10)
                    .background(Color("Black"))
                    .cornerRadius(10)
            }
            FiveStarView(rating: viewModel.rating)
                .frame(width: 126, height: 18)
        }
        .padding(.top, 28)
        .padding(.horizontal, 38)
    }
    
    private var section: some View {
        HStack {
            Text("Shop")
                .font(Font.appFont(size: 20, style: .medium))
                .padding(.horizontal)
                .padding(.bottom, 8)
                .border(width: 3, edges: [.bottom], color: Color("Orange"))
            
            Spacer()
            Text("Details")
                .font(Font.appFont(size: 20, style: .light))
                .opacity(0.5)
            Spacer()
            Text("Features")
                .font(Font.appFont(size: 20, style: .light))
                .opacity(0.5)
        }
        .padding(.leading, 27)
        .padding(.trailing, 40)
        .padding(.top, 32)
    }
    
    private var specification: some View {
        HStack {
            VStack {
                Image("Processor")
                    .frame(width: 28, height: 28)
                Text(viewModel.cpu)
                    .font(Font.appFont(size: 11, style: .light))
                    .foregroundColor(Color("Gray"))
            }
            Spacer()
            VStack {
                Image("Camera")
                    .frame(width: 28, height: 28)
                Text(viewModel.camera)
                    .font(Font.appFont(size: 11, style: .light))
                    .foregroundColor(Color("Gray"))
            }
            Spacer()
            VStack {
                Image("RAM")
                    .frame(width: 28, height: 28)
                Text(viewModel.ram)
                    .font(Font.appFont(size: 11, style: .light))
                    .foregroundColor(Color("Gray"))
            }
            Spacer()
            VStack {
                Image("Memory")
                    .frame(width: 28, height: 28)
                Text(viewModel.memory)
                    .font(Font.appFont(size: 11, style: .light))
                    .foregroundColor(Color("Gray"))
            }
            
        }
        .padding(.leading, 30)
        .padding(.trailing, 40)
        .padding(.top, 33)
    }
    
    private var variants: some View {
        VStack (alignment: .leading) {
            Text("Select color and capacity")
                .font(Font.appFont(size: 16, style: .regular))
            HStack {
                HStack(spacing: 18) {
                    ForEach(Array(viewModel.colors.enumerated()), id: \.offset) { i, color in
                        Image("Okay")
                            .frame(width: 40, height: 40)
                            .hidden(isSelectedColor != i)
                            .background(
                                Circle()
                                    .foregroundColor(Color(hex: color)))
                            .onTapGesture {
                                isSelectedColor = i
                            }
                    }
                }
                Spacer()
                HStack (spacing: 20) {
                    ForEach(Array(viewModel.capacity.enumerated()), id: \.offset) { i, capacity in
                        Text(isSelectedCapacity == i ? "\(capacity) GB" : "\(capacity) gb")
                            .foregroundColor(isSelectedCapacity == i ? Color("White") : Color("DarkGray"))
                            .font(Font.appFont(size: 18, style: .regular))
                            .padding(10)
                            .background(isSelectedCapacity == i ? Color("Orange") : Color("White"))
                            .cornerRadius(10)
                            .onTapGesture {
                                isSelectedCapacity = i
                            }
                    }
                }
            }
        }
        .padding(.top, 25)
        .padding(.leading, 35)
        .padding(.trailing, 63)
    }
    
    private var cart: some View {
        HStack {
            Text("Add to Cart")
            Spacer()
            Text(viewModel.price)
        }
        .font(Font.appFont(size: 20, style: .medium))
        .foregroundColor(Color("White"))
        .padding(.leading, 45)
        .padding(.trailing, 38)
        .padding(.top, 14)
        .padding(.bottom, 15)
        .background(Rectangle()
                        .foregroundColor(Color("Orange")))
        .cornerRadius(10)
        .padding(.horizontal, 30)
        .padding(.top, 27)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
