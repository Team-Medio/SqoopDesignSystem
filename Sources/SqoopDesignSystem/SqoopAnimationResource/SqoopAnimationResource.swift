//
//  SqoopAnimationResource.swift
//  SqoopDesignSystem
//
//  Created by 김민준 on 11/4/24.
//

import Foundation

// MARK: - SqoopAnimationResource

public enum SqoopAnimationResource {
    
    case inSqoop
    case reSqoop
    case sending
    
    /// 애니메이션 파일 URL을 반환합니다.
    @MainActor public var url: URL? {
        
        let url = Bundle.designSystem.url(
            forResource: name,
            withExtension: `extension`
        )
        
        return url
    }
    
    /// 애니메이션의 파일명을 반환합니다.
    public var name: String {
        switch self {
        case .inSqoop: return "InSqoop"
        case .reSqoop: return "ReSqoop"
        case .sending: return "Sending"
        }
    }
    
    /// 애니메이션 파일의 확장자를 반환합니다.
    public var `extension`: String {
        switch self {
        case .inSqoop: return "mp4"
        case .reSqoop: return "mp4"
        case .sending: return "mp4"
        }
    }
}
