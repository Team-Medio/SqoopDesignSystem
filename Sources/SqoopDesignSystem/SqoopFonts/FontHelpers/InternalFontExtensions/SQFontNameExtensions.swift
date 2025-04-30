//
//  SQFontNameExtensions.swift
//  Sqoop
//
//  Created by Greem on 10/9/24.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#else
import AppKit
#endif
// 폰트 매니저에 등록된 폰트가 있으면 그 폰트에 맞는 Font를 가져옵니다.
extension SQFontName{
    @MainActor func getFont(fontSystem: SQFontSystem) -> Font {
        guard let font = SQFontManager.shared.fontItems[self]?.getFont(fontSystem: fontSystem) else {
            return fontSystem.defaultFont
        }
        return font
    }
#if canImport(UIKit)
    @MainActor func getUIFont(fontSystem: SQFontSystem) -> UIFont {
        guard let font = SQFontManager.shared.fontItems[self]?.getUIFont(fontSystem: fontSystem) else {
            return fontSystem.defaultUIFont
        }
        return font
    }
#else
    @MainActor func getNSFont(fontSystem: SQFontSystem) -> NSFont {
        guard let font = SQFontManager.shared.fontItems[self]?.getNSFont(fontSystem: fontSystem) else {
            fatalError("SQFontManager에 등록되지 않음!!")
        }
        return font
    }
#endif
    
    
}
