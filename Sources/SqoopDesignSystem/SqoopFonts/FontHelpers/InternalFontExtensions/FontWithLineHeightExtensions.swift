//
//  FontExtensions.swift
//  Sqoop
//
//  Created by Greem on 10/8/24.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#else
import AppKit
#endif

extension View{
    /// 폰트에 설정된 lineheight에 맞도록 적용할 수 있습니다.
    @ViewBuilder public func fontWithLineHeight(_ font: SQFontSystem) -> some View{
        modifier(FontWithLineHeight(fontSystem: font))
    }
}

struct FontWithLineHeight: ViewModifier {
    let fontSystem: SQFontSystem
    private var lineHeight: CGFloat { fontSystem.lineHeight } // Text 의 전체 높이 (Full Height)
    #if canImport(UIKit)
    private var font: UIFont { UIFont.getUIFont(fontSystem) } // 입력받은 폰트
    
    func body(content: Content) -> some View {
        content
            .font(Font.getFont(fontSystem))
            .lineSpacing(lineHeight - font.lineHeight)
            .padding(.vertical, (lineHeight - font.lineHeight) / 2)
    }
    #else
    private var font: NSFont { NSFont.getNSFont(fontSystem) } // 입력받은 폰트
    var fontLineHeight: CGFloat { font.ascender - font.descender + font.leading }
    func body(content: Content) -> some View {
        content
            .font(Font.getFont(fontSystem))
            .lineSpacing(lineHeight - fontLineHeight)
            .padding(.vertical, (lineHeight - fontLineHeight) / 2)
    }
    #endif
    

    
}

#if canImport(UIKit)
extension UIFont {
    @MainActor fileprivate static func getUIFont(_ fontSystem: SQFontSystem) -> UIFont {
        defaultFont.getUIFont(fontSystem: fontSystem)
    }
}
#else
extension NSFont {
    @MainActor fileprivate static func getNSFont(_ fontSystem: SQFontSystem) -> NSFont {
        defaultFont.getNSFont(fontSystem: fontSystem)
    }
}
#endif

extension Font {
    @MainActor fileprivate static func getFont(_ fontSystem:SQFontSystem) -> Font {
        defaultFont.getFont(fontSystem: fontSystem)
    }
}
