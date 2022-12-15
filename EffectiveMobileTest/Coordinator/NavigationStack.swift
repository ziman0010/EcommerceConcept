//
//  NavigationStack.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 07.12.2022.
//

import SwiftUI

final class NavigationStack: ObservableObject {
    
    @Published private var viewStack: [NavigationItem] = []
    @Published var currentView: NavigationItem
    
    init(_ currentView: NavigationItem) {
        self.currentView = currentView
    }
    
    func unwind() {
        if viewStack.count == 0 {
            return
        }
        let last = viewStack.count - 1
        currentView = viewStack[last]
        viewStack.remove(at: last)
    }
    
    func push (_ view: Screens) {
        let navItem = NavigationItem(view: view.rawValue)
        viewStack.append( currentView)
        currentView = navItem
    }
}
