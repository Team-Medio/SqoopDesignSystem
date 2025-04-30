//
//  FontSystem.swift
//  Sqoop
//
//  Created by Greem on 10/8/24.
//

import SwiftUI
import UIKit

/// Sqoop에서 정의한 폰트 디자인시스템입니다.
public enum SQFontSystem {
    case highlight01
    case highlight02
    case highlight03
    case highlight04
    
    case headline01
    case headline02
    case headline03(weight: SQFontWeight)
    
    case title01(weight: SQFontWeight)
    
    case body01(weight:SQFontWeight)
    case body02(weight:SQFontWeight)
    
    case caption01
    case caption02
    
    case alert01
    case alert02
    
    case custom(size: CGFloat, weight: SQFontWeight)
}
/// 폰트 사이즈입니다.
extension SQFontSystem {
    var size: CGFloat{
        switch self{
        case .highlight01: 40
        case .highlight02: 36
        case .highlight03: 32
        case .highlight04: 28
        case .headline01: 26
        case .headline02: 20
        case .headline03: 18
        case .title01: 17
        case .body01: 16
        case .body02: 14
        case .caption01: 12
        case .caption02: 10
        case .alert01: 12
        case .alert02: 12
        case .custom(let size, _): size
        }
    }
}

// MARK: -- 폰트에서 정의한 lineHeight입니다.
extension SQFontSystem {
    var lineHeight: CGFloat {
        switch self{
        case .highlight01: return 40
        case .highlight02: return 36
        case .highlight03: return 36
        case .highlight04: return 33
            
        case .headline01: return 33
        case .headline02: return 27
        case .headline03: return 24
        
            
        case .title01: return 22
            
        case .body01(weight: _): return 22
        case .body02: return 20
            
        case .caption01: return 22
        case .caption02: return 20
            
        case .alert01, .alert02: return 17
            
        case .custom(let size, _): return size + 4
        }
    }
}

// MARK: -- 폰트에서 정의한 Weight입니다.
extension SQFontSystem {
    var weight: SQFontWeight {
        switch self {
        case .highlight01, .highlight02, .highlight03,.highlight04: .bold
        case .headline01, .headline02: .semiBold
        case .headline03(weight: let weight),
                .title01(weight: let weight),
                .body01(weight: let weight),
                .body02(weight: let weight): weight
        case .caption01, .caption02: .regular
        case .alert01: .semiBold
        case .alert02: .regular
        case .custom(_, let weight): weight
        }
    }
}

extension SQFontSystem {
    var defaultUIFont: UIFont {
        switch self.weight {
        case .bold: .systemFont(ofSize: self.size, weight: .bold)
        case .medium: .systemFont(ofSize: self.size, weight: .medium)
        case .regular: .systemFont(ofSize: self.size, weight: .regular)
        case .semiBold: .systemFont(ofSize: self.size, weight: .semibold)
        }
    }
}

extension SQFontSystem {
    var defaultFont: Font {
        switch self.weight {
        case .bold: .system(size: self.size, weight: .bold)
        case .medium: .system(size: self.size, weight: .medium)
        case .regular: .system(size: self.size, weight: .regular)
        case .semiBold: .system(size: self.size, weight: .semibold)
        }
    }
}
