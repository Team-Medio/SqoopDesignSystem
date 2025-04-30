//
//  SQImageResource.swift
//  SqoopDesignSystem
//
//  Created by 김민준 on 11/4/24.
//

import SwiftUI

// MARK: - Image + SQImageResource

extension Image {
    
    /// Sqoop 리소스를 이용해 이미지를 생성합니다.
    public init(_ imageResource: SQImageResource) {
        self.init(imageResource.name, bundle: Bundle.module)
    }
}

// MARK: - SQImageResource

public enum SQImageResource {
    case emptyMusic
    case emptyThumbnail
    
    case linkInput
    case sqoopFail
    case youtubeLink
    
    case inSqooping
    case doneSqooping
    case reSqooping
    case cloudComplete
    case sendPlaylistProgress
    case sqoopFailed
    
    case youtubeIcon
    case emptyComment
    
    /// 이미지 리소스 이름을 반환합니다.
    var name: String {
        switch self {
        case .emptyMusic: "emptyMusic"
        case .emptyThumbnail: "emptyThumbnail"
        case .linkInput: "linkInput"
        case .sqoopFail: "sqoopFail"
        case .youtubeLink: "youtubeLink"
        case .inSqooping: "inSqooping"
        case .doneSqooping: "doneSqooping"
        case .reSqooping: "reSqooping"
        case .cloudComplete: "cloudComplete"
        case .sendPlaylistProgress: "sendPlaylistProgress"
        case .sqoopFailed: "sqoopFailed"
        case .youtubeIcon: "youtubeIcon"
        case .emptyComment: "emptyComment"
        }
    }
}
