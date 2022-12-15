//
//  Screens.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 04.12.2022.
//

import Foundation
import SwiftUI

enum Screens {
    case storeView
    case detailView
    case cartView
    
    var rawValue: AnyView {
        switch self {
        case .storeView:
            return AnyView(StoreView())
        case .detailView:
            return AnyView(DetailView())
        case .cartView:
            return AnyView(CartView(viewModel: CartViewModel()))
        }
    }
}
