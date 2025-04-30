//
//  FontExtension.swift
//  Sqoop
//
//  Created by Greem on 10/9/24.
//

import Foundation
import SwiftUI

/// 기본으로 정의한 폰트에 접근해서 가져올 수 있습니다.
@MainActor public extension Font{
    static internal var defaultFont: SQFontName = .pretendard
    
    //MARK: -- Hightlight Font
    static var highlight01: Font { defaultFont.getFont(fontSystem: .highlight01) }
    static var highlight02: Font { defaultFont.getFont(fontSystem: .highlight02) }
    static var highlight03: Font { defaultFont.getFont(fontSystem: .highlight03) }
    static var highlight04: Font { defaultFont.getFont(fontSystem: .highlight04) }
    
    //MARK: -- Headline Font
    static var headline01: Font { defaultFont.getFont(fontSystem: .headline01) }
    static var headline02: Font { defaultFont.getFont(fontSystem: .headline02) }
    static func headline03(_ weight: SQFontWeight = .regular) -> Font { defaultFont.getFont(fontSystem: .headline03(weight: weight))
    }
    
    //MARK: -- Title Font
    static func title01(_ weight: SQFontWeight = .regular) -> Font {
        defaultFont.getFont(fontSystem: .title01(weight: weight))
    }
    
    //MARK: -- Body Font
    static func body01(_ weight: SQFontWeight = .regular) -> Font {
        defaultFont.getFont(fontSystem: .body01(weight: weight))
    }
    static func body02(_ weight: SQFontWeight = .regular) -> Font {
        defaultFont.getFont(fontSystem: .body02(weight: weight))
    }
    
    //MARK: -- Caption Font
    static var caption01: Font { defaultFont.getFont(fontSystem: .caption01) }
    static var caption02: Font { defaultFont.getFont(fontSystem: .caption02) }
    
    
    //MARK: -- Alert Font
    static var alert01: Font { defaultFont.getFont(fontSystem: .alert01) }
    static var alert02: Font { defaultFont.getFont(fontSystem: .alert02) }
    
    func custom(by: SQFontName, weight: SQFontWeight, size: CGFloat) -> Font {
        .custom("\(by.rawValue)-\(weight.name)",size: size)
    }
    static func custom(by: SQFontName, weight: SQFontWeight, size: CGFloat) -> Font {
        .custom("\(by.rawValue)-\(weight.name)",size: size)
    }
}
