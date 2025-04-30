//
//  JPPretendard.swift
//  SqoopDesignSystem
//
//  Created by Greem on 11/3/24.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#endif
#if canImport(AppKit)
import AppKit
#endif


struct JPPretendard: FontProvider {
    let fontName:SQFontName = .jpPretendard
    
    var getFontWeights: [SQFontWeight] { [.bold, .semiBold, .regular, .medium] }
    
    func getFont(fontSystem: SQFontSystem) -> Font {
        return .custom(fontName: fontName,weight: fontSystem.weight, size: fontSystem.size)
    }
    
#if canImport(AppKit)
    func getNSFont(fontSystem: SQFontSystem) -> NSFont {
        return .init(fontName: fontName,weight: fontSystem.weight, size: fontSystem.size)
    }
#endif
    
#if canImport(UIKit)
    func getUIFont(fontSystem: SQFontSystem) -> UIFont {
        return .init(fontName: fontName,weight: fontSystem.weight, size: fontSystem.size)
    }
#endif
}
