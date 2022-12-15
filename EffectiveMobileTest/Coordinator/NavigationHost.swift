//
//  NavigationHost.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 07.12.2022.
//

import SwiftUI

struct NavigationHost: View {
    @EnvironmentObject var navigation: NavigationStack
    
    var body: some View {
        self.navigation.currentView.view
    }
}
