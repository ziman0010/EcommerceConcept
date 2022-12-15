//
//  Coordinator.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 04.12.2022.
//

import Foundation

final class Coordinator: ObservableObject {
    
    @Published var currentView: Screens = .storeView
}
