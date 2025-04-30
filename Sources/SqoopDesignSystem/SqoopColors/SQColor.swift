//
//  SQColor.swift
//  SqoopDesignSystem
//
//  Created by Greem on 10/28/24.
//

import SwiftUI

//MARK: -- Background
public extension Color {
    static var bgBlack: Color { Color(hex: "#000000") }
    static var bgDisabled: Color { Color(hex: "#8F8F8F") }
    static var bgGrey1: Color { Color(hex: "#8F8F8F") }
    static var bgGrey2: Color { Color(hex: "#4C4C4C") }
    static var bgGrey250: Color { Color(hex: "#656565") }
    static var bgGrey3: Color { Color(hex: "#1B1B1B") }
    static var bgGreyTransparent1: Color { Color(hex: "#4C4C4C").opacity(0.2) }
    static var bgGreyTransparent2: Color { Color(hex: "#4C4C4C").opacity(0.4) }
    static var bgPrimary: Color { Color(hex: "#0ED0DB") }
    static var bgSecondary: Color { Color(hex: "#0AA2AB") }
    static var bgTertiary: Color { Color(hex: "#174F53") }
    static var bgSelected: Color { Color(hex: "#202D2E") }
}

//MARK: -- Border
public extension Color {
    static var bdBlack: Color { Color(hex: "#000000") }
    static var bdGrey1: Color { Color(hex: "#8F8F8F") }
    static var bdGrey2: Color { Color(hex: "#656565") }
    static var bdGrey3: Color { Color(hex: "#4C4C4C") }
    static var bdGrey4: Color { Color(hex: "#1B1B1B") }
    static var bdPrimary: Color { Color(hex: "#0ED0DB") }
    static var bdSecondary: Color { Color(hex: "#0AA2AB") }
    static var bdWhite: Color { Color(hex: "#FFFFFF") }
}

//MARK: -- Text
public extension Color {
    static var textDisabled: Color { Color(hex: "#E6E6E6") }
    static var textInverse: Color { Color(hex: "#000000") }
    static var textPrimary: Color { Color(hex: "#FFFFFF") }
    static var textSecondary: Color { Color(hex: "#D1D1D1") }
    static var textTertiary: Color { Color(hex: "#8F8F8F") }
    static var textAccent: Color { Color(hex: "#0ED0DB") }
    static var textBrand: Color { Color(hex: "#0ED0DB") }
    static var textPressed: Color { Color(hex: "#174F53") }
}

//MARK: -- Icon
public extension Color {
    static var iconPrimary: Color { Color(hex: "#FFFFFF") }
    static var iconSkyBlue: Color { Color(hex: "#0ED0DB") }
}
