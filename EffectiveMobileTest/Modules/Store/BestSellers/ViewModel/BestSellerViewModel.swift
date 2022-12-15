//
//  BestSellerViewModel.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 13.12.2022.
//

import Foundation

final class BestSellerViewModel: Identifiable, ObservableObject {
    
    @Published private var innerModel: BestSellerModel
    private var formatter: Formatter
    
    init(model: BestSellerModel) {
        self.innerModel = model
        self.formatter = Formatter()
    }
    
    var isFavorite: Bool {
        innerModel.isFavorite
    }
    
    var title: String {
        innerModel.title
    }
    
    var priceWithoutDiscount: String {
        formatter.formatPrice(innerModel.priceWithoutDiscount)
    }
    
    var discountPrice: String {
        formatter.formatPrice(innerModel.discountPrice)
    }
    
    var imageUrlString: String {
        innerModel.imageUrl
    }
    
    
}
