//
//  Font+.swift
//  INJAE
//
//  Created by 박현수 on 11/9/24.
//

import Foundation
import SwiftUI

extension Font {
    static func moveSans(weight: MoveSansWeight, size: CGFloat) -> Font {
        return Font.custom(weight.fontName, size: size)
    }
}

enum MoveSansWeight: String {
    case light = "MoveSans-Light"
    case medium = "MoveSans-Medium"
    case bold = "MoveSans-Bold"

    var fontName: String {
        return self.rawValue
    }
}
