//
//  HotSaleViewModel.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 13.12.2022.
//

import Foundation

final class HotSaleViewModel: ObservableObject {
    
    @Published private var innerModel: HotSaleModel
    
    init(model: HotSaleModel) {
        
        self.innerModel = model
    }
    
    var isNew: Bool {
        innerModel.isNew
    }
    
    var title: String {
        innerModel.title
    }
    
    var subtitle: String {
        innerModel.subtitle
    }
    
    var isBuy: Bool {
        innerModel.isBuy
    }
    
    var imageUrlString: String {
        innerModel.imageUrl
    }
}
