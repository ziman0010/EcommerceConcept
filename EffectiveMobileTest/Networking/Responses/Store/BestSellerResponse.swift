//
//  BestSellerResponse.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 09.12.2022.
//

import Foundation

struct BestSellerResponse: Codable {
    
    let id: Int
    let isFavorite: Bool
    let title: String
    let priceWithoutDiscount: Int
    let discountPrice: Int
    let picture: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case isFavorite = "is_favorites"
        case title
        case priceWithoutDiscount = "discount_price" // Тут в json перепутаны поля цены со скидкой и без, для наглядности поменял местами
        case discountPrice = "price_without_discount"
        case picture
    }
}
