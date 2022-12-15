//
//  CartResponse.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 14.12.2022.
//

import Foundation

struct CartResponse: Codable {
    
    let cart: [CartItemResponse]
    let delivery: String
    let id: String
    let total: Int
    
    private enum CodingKeys: String, CodingKey {
        case cart = "basket"
        case delivery, id, total
    }
}
