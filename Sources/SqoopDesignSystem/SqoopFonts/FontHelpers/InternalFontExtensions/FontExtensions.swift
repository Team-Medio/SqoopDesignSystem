//
//  FontExtensions.swift
//  SqoopDesignSystem
//
//  Created by Greem on 11/3/24.
//

import SwiftUI


/// SwiftUI 폰트를 빠르게 정의하기 위한 메서드 입니다.
extension Font {
    static func custom(fontName: SQFontName,weight: SQFontWeight, size: CGFloat) -> Font {
        .custom(fontName.rawValue + "-" + weight.name , size: size)
    }
}
