//
//  ChannelInfoLabel.swift
//  SqoopDesignDemos
//
//  Created by Greem on 11/23/24.
//

import SwiftUI
import SqoopDesignSystem

struct ChannelInfoLabel: View {
    let name: String
    let subscriberCount: Int
    private let langType: LanguageType = .getPreffered()
    var body: some View {
        VStack(alignment: .leading ,spacing: 2) {
            Text(name)
                .font(.title01(.bold))
            
            HStack(alignment: .firstTextBaseline,spacing:3) {
                if !langType.subscriberChunkPrefix.isEmpty {
                    Text(langType.subscriberChunkPrefix).font(.system(size: 13))
                }
                Text(subscriberCountText).font(.caption01)
            }.foregroundStyle(Color.textTertiary)
                .frame(height: 22)
        }
    }
    
    /// 영어: subscribers 12.4K
    /// 한국어: 구독자 1.24만
    /// 일본어: 超1.24人
    private var subscriberCountText: String {
        let langNumeral: String = subscriberCount.sqNumeralSystem(language: langType)
        // 디자인 요구사항에 따라 문자열 분리 가능
        return langNumeral + langType.subscriberChunkLast
    }
}


fileprivate extension LanguageType {
    var subscriberChunkPrefix: String {
        switch self {
        case .en: "Subscribers"
        case .ja: "チャンネル登録者数"
        case .ko: "구독자"
        @unknown default: "Subscribers"
        }
    }
    var subscriberChunkLast: String {
        switch self {
        case .en: ""
        case .ja: "人"
        case .ko: "명"
        @unknown default: ""
        }
    }
}
