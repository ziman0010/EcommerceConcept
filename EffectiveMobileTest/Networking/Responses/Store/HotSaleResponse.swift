//
//  HotSale.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 09.12.2022.
//

import Foundation

struct HotSaleResponse: Codable {
    
    let id: Int
    let isNew: Bool?
    let title: String
    let subtitle: String
    let picture: String
    let isBuy: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id
        case isNew = "is_new"
        case title
        case subtitle
        case picture
        case isBuy = "is_buy"
    }
}
