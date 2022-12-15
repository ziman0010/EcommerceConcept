//
//  HomeStoreResponse.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 09.12.2022.
//

import Foundation

struct HomeStoreResponse: Codable {
    
    let hotSales: [HotSaleResponse]
    let bestSellers: [BestSellerResponse]
    
    private enum CodingKeys: String, CodingKey {
        case hotSales = "home_store"
        case bestSellers = "best_seller"
    }
}

