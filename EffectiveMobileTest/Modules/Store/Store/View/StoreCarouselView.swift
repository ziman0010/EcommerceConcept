//
//  CarouselView.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 12.12.2022.

import SwiftUI


struct StoreCarouselView: View {
    
    var viewModels: [HotSaleViewModel]
    
    init(models: [HotSaleModel]) {
        
        self.viewModels = models.map({ model in
            return HotSaleViewModel(model: model)
        })
    }
    
    var body : some View {
        
        TabView() {
            ForEach(Array(viewModels.enumerated()), id: \.offset) { i, viewModel in
                HotSalesView(viewModel: viewModel)
                    .padding(.horizontal, 5)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}
