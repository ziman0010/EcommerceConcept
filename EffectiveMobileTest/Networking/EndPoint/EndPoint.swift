//
//  EndPoint.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 09.12.2022.
//

import Foundation

enum EndPoint: String {
    case store = "/v3/654bd15e-b121-49ba-a588-960956b15175"
    case detail = "/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
    case cart = "/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
    
    var string: String {
        return self.rawValue
    }
}

