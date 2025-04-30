//
//  UIFontExtension.swift
//  Sqoop
//
//  Created by Greem on 10/9/24.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
@MainActor extension UIFont{
    static var defaultFont: SQFontName = .pretendard
    
    //MARK: -- Hightlight Font
    static var highlight01: UIFont { defaultFont.getUIFont(fontSystem: .highlight01) }
    static var highlight02: UIFont { defaultFont.getUIFont(fontSystem: .highlight02) }
    static var highlight03: UIFont { defaultFont.getUIFont(fontSystem: .highlight03) }
    
    //MARK: -- Headline Font
    static var headline01: UIFont { defaultFont.getUIFont(fontSystem: .headline01) }
    static var headline02: UIFont { defaultFont.getUIFont(fontSystem: .headline02) }
    static func headline03(_ weight: SQFontWeight = .regular) -> UIFont { defaultFont.getUIFont(fontSystem: .headline03(weight: weight))
    }
    
    //MARK: -- Title Font
    static func title01(_ weight: SQFontWeight = .regular) -> UIFont {
        defaultFont.getUIFont(fontSystem: .title01(weight: weight))
    }
    
    //MARK: -- Body Font
    static func body01(_ weight: SQFontWeight = .regular) -> UIFont {
        defaultFont.getUIFont(fontSystem: .body01(weight: weight))
    }
    static func body02(_ weight: SQFontWeight = .regular) -> UIFont {
        defaultFont.getUIFont(fontSystem: .body02(weight: weight))
    }
    
    //MARK: -- Caption Font
    static var caption01: UIFont { defaultFont.getUIFont(fontSystem: .caption01) }
    static var caption02: UIFont { defaultFont.getUIFont(fontSystem: .caption02) }
    
    
    //MARK: -- Alert Font
    static var alert01: UIFont { defaultFont.getUIFont(fontSystem: .alert01) }
    static var alert02: UIFont { defaultFont.getUIFont(fontSystem: .alert02) }
    

}


extension UIFont {
    convenience init(fontName: SQFontName,weight: SQFontWeight, size: CGFloat) {
        self.init(name: fontName.rawValue + "-" + weight.name, size: size)!
    }
}

#endif
