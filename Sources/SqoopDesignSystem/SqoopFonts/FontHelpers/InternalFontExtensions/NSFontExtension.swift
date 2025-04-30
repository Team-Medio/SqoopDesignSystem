//
//  File.swift
//  SqoopDesignSystem
//
//  Created by Greem on 10/28/24.
//

import Foundation
#if canImport(AppKit)
import AppKit

@MainActor extension NSFont{
    static var defaultFont: SQFontName = .pretendard
    
    //MARK: -- Hightlight Font
    static var highlight01: NSFont { defaultFont.getNSFont(fontSystem: .highlight01) }
    static var highlight02: NSFont { defaultFont.getNSFont(fontSystem: .highlight02) }
    static var highlight03: NSFont { defaultFont.getNSFont(fontSystem: .highlight03) }
    
    //MARK: -- Headline Font
    static var headline01: NSFont { defaultFont.getNSFont(fontSystem: .headline01) }
    static var headline02: NSFont { defaultFont.getNSFont(fontSystem: .headline02) }
    static func headline03(_ weight: SQFontWeight = .regular) -> NSFont {
        defaultFont.getNSFont(fontSystem: .headline03(weight: weight))
    }
    
    //MARK: -- Title Font
    static func title01(_ weight: SQFontWeight = .regular) -> NSFont {
        defaultFont.getNSFont(fontSystem: .title01(weight: weight))
    }
    
    //MARK: -- Body Font
    static func body01(_ weight: SQFontWeight = .regular) -> NSFont {
        defaultFont.getNSFont(fontSystem: .body01(weight: weight))
    }
    static func body02(_ weight: SQFontWeight = .regular) -> NSFont {
        defaultFont.getNSFont(fontSystem: .body02(weight: weight))
    }
    
    //MARK: -- Caption Font
    static var caption01: NSFont { defaultFont.getNSFont(fontSystem: .caption01) }
    static var caption02: NSFont { defaultFont.getNSFont(fontSystem: .caption02) }
    
    
    //MARK: -- Alert Font
    static var alert01: NSFont { defaultFont.getNSFont(fontSystem: .alert01) }
    static var alert02: NSFont { defaultFont.getNSFont(fontSystem: .alert02) }
    

}

extension NSFont {
    convenience init(fontName: SQFontName,weight: SQFontWeight, size: CGFloat) {
        self.init(name: fontName.rawValue + "-" + weight.name, size: size)!
    }
}

#endif
