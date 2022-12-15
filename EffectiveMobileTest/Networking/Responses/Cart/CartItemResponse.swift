//
//  CartItemResponse.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 14.12.2022.
//

import Foundation

struct CartItemResponse: Codable {
    
    let id: Int
    let image: String
    let price: Int
    let title: String
    
    private enum CodingKeys: String, CodingKey {
        case id, price, title
        case image = "images"
    }
}
