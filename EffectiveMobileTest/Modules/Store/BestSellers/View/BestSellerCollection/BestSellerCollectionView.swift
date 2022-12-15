//
//  BestSellerCollectionView.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 05.12.2022.
//

import SwiftUI

struct BestSellerCollectionView: View {
    
    @EnvironmentObject private var navigation: NavigationStack
    
    var viewModels: [BestSellerViewModel]
    private var columns: [GridItem] = [
        GridItem(.fixed(181), spacing: 16),
        GridItem(.fixed(181), spacing: 16),
    ]
    
    init(models: [BestSellerModel]) {
        self.viewModels = models.map({ model in
            return BestSellerViewModel(model: model)
        })
    }
    
    var body: some View {
        LazyVGrid (columns: columns) {
            ForEach(viewModels) { viewModel in
                BestSellerItemView(viewModel: viewModel)
                    .onTapGesture {
                        navigation.push(.detailView)
                    }
            }
        }
    }
}

struct BestSellerCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        BestSellerCollectionView(models: [])
    }
}
