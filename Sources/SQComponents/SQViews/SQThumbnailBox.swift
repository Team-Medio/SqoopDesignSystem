//
//  SQThumbnailBox.swift
//  Sqoop
//
//  Created by Greem on 10/11/24.
//

import SwiftUI
import SqoopDesignSystem

public extension SQThumbnailBox {
    
    /// 유튜브 URL을 통해 가져온 플리가 하나의 영상인지, 여러 음악을 담은 영상인지 구별하는 타입입니다.
    enum ThumbnailInfoType: Hashable {
        case length(Int)
        case songs(Int)
    }
}

// MARK: - SQThumbnailBox

/// 유튜브 URL을 통해 가져온 플리를 표시하는 뷰입니다.
public struct SQThumbnailBox: View {
    
    public let playlistName: String
    public let channelName: String
    public let thumbnailInfoType: ThumbnailInfoType
    public let originalUrlString: String
    public let thumbnailImageUrlString: String
    public let thumbnailBoxTapAction: () -> Void
    
    public init(
        playlistName: String,
        channelName: String,
        thumbnailInfoType: ThumbnailInfoType,
        originalUrlString: String,
        thumbnailImageUrlString: String,
        thumbnailBoxTapAction: @escaping () -> Void
    ) {
        self.playlistName = playlistName
        self.channelName = channelName
        self.thumbnailInfoType = thumbnailInfoType
        self.originalUrlString = originalUrlString
        self.thumbnailImageUrlString = thumbnailImageUrlString
        self.thumbnailBoxTapAction = thumbnailBoxTapAction
    }
    
    public var body: some View {
        Button {
            thumbnailBoxTapAction()
        } label: {
            VStack(alignment: .leading, spacing: 0) {
                ThumbnailImage(
                    originalUrlString: originalUrlString,
                    thumbnailImageUrlString: thumbnailImageUrlString
                )
                .padding(.top, 20)
                
                Text(playlistName)
                    .padding(.top, 16)
                    .font(.headline03(.semiBold))
                    .foregroundStyle(Color.textPrimary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                HStack(spacing: 10) {
                    ChannelNameLabel(channelName: channelName)
                    ThumbnailInfoLabel(thumbnailInfo: thumbnailInfoType)
                }
                .padding(.bottom, 20)
            }
            .modifier(ThumbnailBoxViewModifier())
        }
    }
}

// MARK: - ThumbnailImage

private struct ThumbnailImage: View {
    
    let originalUrlString: String
    let thumbnailImageUrlString: String
    
    private let imageHeight: CGFloat = 171
    
    private var thumbnailImageUrl: URL? {
        URL(string: thumbnailImageUrlString)
    }
    
    var body: some View {
        AsyncImage(url: thumbnailImageUrl) { phase in
            if let image = phase.image {
                image
                    .resizable().aspectRatio(16/9, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
            } else {
                Image(.emptyThumbnail)
                    .resizable().aspectRatio(16/9, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
            }
        }
    }
}


// MARK: - SQThumbnailBox에서 사용되는 Label

fileprivate extension SQThumbnailBox {
    
    private struct CoreInfoLabel: View {
        
        let symbol: SFSymbol
        let infoString: String
        
        var body: some View {
            HStack(spacing: 6) {
                Image(symbol: symbol)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                
                Text(infoString)
                    .fontWithLineHeight(.body01(weight: .regular))
                    .lineLimit(1)
            }
            .foregroundStyle(Color.textSecondary)
        }
    }
    
    struct ChannelNameLabel: View {
        let channelName: String
        var body: some View {
            CoreInfoLabel(
                symbol: .channelName,
                infoString: channelName
            )
        }
    }
    
    // MARK: - DurationTimeLabel
    
    struct ThumbnailInfoLabel: View {
        var thumbnailInfo: ThumbnailInfoType
        var body: some View {
            CoreInfoLabel(
                symbol: infoSymbol,
                infoString: infoString
            )
        }
        private var infoSymbol: SFSymbol {
            switch thumbnailInfo {
            case .length: .videoLength
            case .songs: .songCount
            }
        }
        private var infoString: String {
            switch thumbnailInfo {
            case .length(let len): durationTimeFormat(durationTime: len)
            case .songs(let songs): "Total %d".localized(with: [songs])
            }
        }
        
        private func durationTimeFormat(durationTime: Int)-> String {
            let hours = durationTime / 3600
            let minutes = (durationTime % 3600) / 60
            let seconds = durationTime % 60
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        }
    }
}

// MARK: - ThumbnailBoxGradient

private struct ThumbnailBoxViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 20)
            .background(Color(hex: "#8F8F8F").opacity(0.16))
            .background(
                GeometryReader { proxy in
                    RadialGradient(
                        stops: .thumbnailBox,
                        center: UnitPoint(x: 0.2, y: 0.32),
                        startRadius: 0,
                        endRadius: proxy.size.width
                    )
                }
            )
            .background(StrokeBorder())
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .frame(minWidth: 343, maxWidth: 408, minHeight: 314, maxHeight: 373)
            .aspectRatio(343/314, contentMode: .fit)
    }
    
    struct StrokeBorder: View {
        var body: some View {
            GeometryReader { proxy in
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(RadialGradient(stops: [
                        .init(color: .init(hex: "#000000").opacity(0.3), location: 0),
                        .init(color: .init(hex: "#0ED0DB"), location: 0.5),
                        .init(color: .init(hex: "#656565").opacity(0.3), location: 1)
                    ], center: {
                        var center: UnitPoint = .topLeading
                        center.x += 0.19; center.y += 0.32
                        return center
                    }(), startRadius: 0, endRadius: proxy.size.width), lineWidth: 1.5)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        SQThumbnailBox(
            playlistName: "플레이리스트 제목 입력",
            channelName: "한톨TV",
            thumbnailInfoType: .songs(32),
            originalUrlString: "https://www.youtube.com/watch?v=fTwVEu6itik",
            thumbnailImageUrlString: ""
        ) {}
        .padding(.horizontal, 16)
    }
    .loadSqoopFontSystem()
}
