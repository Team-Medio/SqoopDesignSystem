//
//  LanguageType.swift
//  SqoopDesignDemos
//
//  Created by Greem on 11/24/24.
//

import Foundation

/// "언어 타입에 따른 단위 시스템 추가"
enum LanguageType: String {
    case ko = "ko"
    case ja = "ja"
    case en = "en"
    static func getPreffered() -> LanguageType {
        guard let language = Bundle.main.preferredLocalizations.first else { return .en }
        return switch language {
        case "ko": .ko
        case "ja": .ja
        case "en": .en
        default: .en
        }
    }
}
