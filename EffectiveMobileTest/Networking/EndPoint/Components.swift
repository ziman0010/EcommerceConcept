//
//  API.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 09.12.2022.
//

import Foundation

struct Components {
    let scheme = "https"
    let host = "run.mocky.io"
    let endPoint: EndPoint
    
    func getUrl() -> URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = endPoint.string
        
        return components.url
    }
}
