//
//  SQPlaylistInfo.swift
//  Sqoop
//
//  Created by Greem on 10/11/24.
//

import SwiftUI
import SqoopDesignSystem

/// 로딩 중 플레이리스트 정보를 표시하는 뷰 입니다.
public struct SQPlaylistInfo: View {
    public let title: String
    public let channelName: String
    public let thumbnailImageUrl: String
    
    public init(title: String, channelName: String, thumbnailImageUrl: String) {
        self.title = title
        self.channelName = channelName
        self.thumbnailImageUrl = thumbnailImageUrl
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            ThumbnailImage(thumbnailImageUrlString: thumbnailImageUrl)
                .padding(.vertical, 12)
                .padding(.leading, 12)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .fontWithLineHeight(.title01(weight: .semiBold))
                    .lineLimit(2)
                    .foregroundStyle(Color.textPrimary)
                
                Text(channelName)
                    .fontWithLineHeight(.body02(weight: .regular))
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(Color.textSecondary)
            }
            .foregroundStyle(Color.textPrimary)
            
            Spacer()
        }
        .frame(minWidth: 343,maxWidth: 408)
        .frame(height: 96)
        .background(
            GeometryReader { proxy in
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.bgGreyTransparent1)
                    .strokeBorder(
                        RadialGradient(stops: .playlistRing,
                                       center: UnitPoint(x: 0.2, y: 0.1),
                                       startRadius: 0, endRadius: proxy.size.width)
                        , lineWidth: 1.5
                    )
            }

        )
    }
}

// MARK: - ThumbnailImage

private struct ThumbnailImage: View {
    
    let thumbnailImageUrlString: String
    
    private var thumbnailImageUrl: URL? {
        URL(string: thumbnailImageUrlString)
    }
    
    var body: some View {
        AsyncImage(url: thumbnailImageUrl) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(16/9, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
            } else {
                Image(.emptyThumbnail)
                    .resizable()
                    .aspectRatio(16/9, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
            }
        }
    }
}

#Preview(body: {
    ZStack {
        Color.black.ignoresSafeArea(.all)
        SQPlaylistInfo(title: "asfd", channelName: "asdf", thumbnailImageUrl: "").loadSqoopFontSystem()
    }
})
