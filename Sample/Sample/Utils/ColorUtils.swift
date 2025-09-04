//
//  ColorUtils.swift
//  Sample
//
//  Created by Moni on 03/09/25.
//

import Foundation
import SwiftUI

extension Color {
    static let customColor = Color.CustomColor()

    struct CustomColor {
        let primaryOrangeColor = Color("primary_orange_color")
        let secondaryOrangeColor = Color("secondary_orange_color")
    }
}
