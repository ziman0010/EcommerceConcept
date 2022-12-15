//
//  DetailResponse.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 13.12.2022.
//

import Foundation

struct DetailResponse: Codable {
    
    let cpu: String
    let camera: String
    let capacity: [String]
    let colors: [String]
    let id: String
    let images: [String]
    let isFavorite: Bool
    let price: Int
    let rating: Double
    let memory: String
    let ram: String
    let title: String
    
    private enum CodingKeys: String, CodingKey {
        case camera, capacity, id, images, price, rating, title
        case cpu = "CPU"
        case isFavorite = "isFavorites"
        case memory = "sd"
        case ram = "ssd"
        case colors = "color"
    }
}
