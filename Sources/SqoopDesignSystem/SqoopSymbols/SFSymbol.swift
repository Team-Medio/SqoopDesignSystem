//
//  SFSymbol.swift
//  SqoopDesignSystem
//
//  Created by Greem on 10/28/24.
//

import SwiftUI

// MARK: - Image + SFSymbol

extension Image {
    
    /// Sqoop에서 사용하는 SFSymbol 이미지를 생성하기 위한 이니셜라이저입니다.
    public init(symbol: SFSymbol) {
        self.init(systemName: symbol.name)
    }
}

// MARK: - SFSymbol

public enum SFSymbol {
    
    public static let size: CGFloat = 24
    
    case activeCheckMark
    case alert
    case arrowDown
    case arrowLeft
    case arrowRight
    case arrowUp
    case arrowRightCircle
    case cancel
    case channelName
    case check
    case close
    case comments
    case delete
    case ellipsis
    case error
    case info
    case inActiveCheckMark
    case link
    case pause
    case reset
    case search
    case searchCancel
    case selectAll
    case selectNone
    case setting
    case song
    case songCount
    case video
    case videoLength
    case waveform
    case tip
    case dateSelector
    case weeklyRankingPlaylist
    
    /// SFSymbol RawString을 반환합니다.
    public var name: String {
        switch self {
        case .activeCheckMark: "checkmark.circle.fill"
        case .alert: "exclamationmark.circle"
        case .arrowDown: "chevron.down"
        case .arrowLeft: "chevron.left"
        case .arrowRight: "chevron.right"
        case .arrowUp: "chevron.up"
        case .arrowRightCircle: "chevron.right.circle.fill"
        case .cancel: "arrowshape.turn.up.backward.fill"
        case .channelName: "person.circle.fill"
        case .check: "checkmark"
        case .close: "xmark"
        case .comments: "captions.bubble.fill"
        case .delete: "trash"
        case .ellipsis: "ellipsis"
        case .error: "questionmark.app"
        case .info: "info.circle"
        case .inActiveCheckMark: "circle"
        case .link: "link"
        case .pause: "pause.fill"
        case .reset: "arrow.clockwise.circle.fill"
        case .search: "magnifyingglass"
        case .searchCancel: "xmark.circle.fill"
        case .selectAll: "circle.inset.filled"
        case .selectNone: "circle"
        case .setting: "gearshape"
        case .song: "music.note"
        case .songCount: "music.note.list"
        case .video: "play.rectangle.fill"
        case .videoLength: "play.circle"
        case .waveform: "waveform"
        case .tip: "questionmark.circle.fill"
        case .dateSelector: "chevron.up.chevron.down"
        case .weeklyRankingPlaylist: "chart.bar.xaxis.ascending.badge.clock"
        }
    }
    
    /// SFSymbol의 굵기를 반환합니다.
    public var weight: Font.Weight {
        switch self {
        case .activeCheckMark: .semibold
        case .alert: .medium
        case .arrowDown: .medium
        case .arrowLeft: .medium
        case .arrowRight: .regular
        case .arrowUp: .medium
        case .arrowRightCircle: .bold
        case .cancel: .regular
        case .channelName: .regular
        case .check: .heavy
        case .close: .medium
        case .comments: .regular
        case .delete: .regular
        case .ellipsis: .light
        case .error: .regular
        case .info: .light
        case .inActiveCheckMark: .light
        case .link: .regular
        case .pause: .light
        case .reset: .semibold
        case .search: .regular
        case .searchCancel: .regular
        case .selectAll: .regular
        case .selectNone: .regular
        case .setting: .light
        case .song: .semibold
        case .songCount: .regular
        case .video: .regular
        case .videoLength: .regular
        case .waveform: .regular
        case .tip: .light
        case .dateSelector: .regular
        case .weeklyRankingPlaylist: .heavy
        }
    }
}
