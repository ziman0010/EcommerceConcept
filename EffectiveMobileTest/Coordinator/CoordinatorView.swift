//
//  CoordinatorView.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 04.12.2022.
//

import SwiftUI

struct CoordinatorView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        switch coordinator.currentView {
        case .startView:
            Text("StartView")
        case .storeView:
            StoreView()
        case .detailView:
            Text("DetailView")
        }
    }
}
