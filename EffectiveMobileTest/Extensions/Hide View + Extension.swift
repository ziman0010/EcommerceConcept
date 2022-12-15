//
//  Hide View + Extension.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 07.12.2022.
//

import SwiftUI

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true:
            self.hidden()
        case false:
            self
        }
    }
}
