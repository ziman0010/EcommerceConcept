//
//  Font + Extension.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 02.12.2022.
//

import SwiftUI

extension Font {
    enum Style {
        case light
        case regular
        case medium
        case bold
    }
    static func appFont(size: CGFloat, style: Style) -> Font {
        switch style {
        case .light:
            return Font.custom("MarkPro", size: size)
        case .regular:
            return Font.custom("MarkPro-Medium", size: size)
        case .medium:
            return Font.custom("MarkPro-Bold", size: size)
        case .bold:
            return Font.custom("MarkPro-Heavy", size: size)
        }
    }
}
