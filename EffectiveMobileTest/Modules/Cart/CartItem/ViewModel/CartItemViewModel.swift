//
//  CartItemViewModel.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 14.12.2022.
//

import Foundation

final class CartItemViewModel: ObservableObject {
    
    @Published private var innerModel: CartItemModel
    
    private let formatter: Formatter
    
    init(model: CartItemModel) {
        
        self.innerModel = model
        self.formatter = Formatter()
    }
    
    var id: Int {
        innerModel.id
    }
    
    var price: String {
        formatter.formatPrice(innerModel.price * innerModel.count)
    }
    
    var imageUrlString: String {
        innerModel.image
    }
    
    var title: String {
        innerModel.title
    }
    
    var count: Int {
        get {
            innerModel.count
        }
        
        set {
            innerModel.count = newValue
        }
    }
}
