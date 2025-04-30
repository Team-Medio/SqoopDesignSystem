//
//  FontManager.swift
//  Sqoop
//
//  Created by Greem on 10/8/24.
//

import SwiftUI

/// 사용하고자 하는 폰트를 등록합니다.
/// 폰트에 대한 정보가 객체가 등록되어있어야 합니다.
/// 폰트 정보 객체 FontProvider라는 프로토콜을 준수합니다.
/// SQFontManager에 등록되지 않은 SQFontName을 접근하면 오류가 발생합니다.
/// SQFontName을 통해 실제 폰트 정보를 가져올 수 있습니다.

final class SQFontManager{
    @MainActor static let shared = SQFontManager()
    private(set) lazy var fontItems: [SQFontName: FontProvider] = [:]
    
    /// 기본 폰트 변경만 제공함
    /// 아직 폰트 시스템이 확정되지 않아서 일본어,영어,한국어 폰트 변경 대응
    private init(){
        // 사용자의 디바이스 언어 설정, 다국어 대응 상황에 맞춰 최적의 언어 코드를 가져옴
        let preffered = Bundle.main.preferredLocalizations.first
        let fontName: SQFontName = .pretendard
        fontItems = [.pretendard: Pretendard()]
        
        Task { @MainActor in
            Font.defaultFont = fontName
            #if os(iOS)
            UIFont.defaultFont = fontName
            #else
            NSFont.defaultFont = fontName
            #endif
        }
    }
    
    @MainActor func registerFonts() {
        for (key,value) in fontItems {
            value.getFontWeights.forEach { weight in
                let fontName = "\(key.rawValue)-\(weight.name).otf"
                guard let url = Bundle.designSystem.url(forResource: fontName, withExtension: nil) else {
                    fatalError("Can't load it \(fontName)")
                }
                
                CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
            }
        }
    }

}



