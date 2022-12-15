//
//  Formatter.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 14.12.2022.
//

import Foundation

final class Formatter {
    
    func formatPrice(_ price: Int) -> String {
        
        var counter = 0
        var result = String(String(price).reversed())
        for index in 0..<result.count {
            if index % 3 == 0 && index > 0 {
                result.insert(",", at: result.index(result.startIndex, offsetBy: index + counter))
                counter += 1
            }
        }
        var result1 = String(result.reversed())
        result1.insert("$", at: result.startIndex)
        return result1
    }
}
