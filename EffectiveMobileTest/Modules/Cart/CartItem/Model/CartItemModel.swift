//
//  CartItemModel.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 14.12.2022.
//

struct CartItemModel: Identifiable {
    
    let id: Int
    let image: String
    let price: Int
    let title: String
    var count: Int
}
