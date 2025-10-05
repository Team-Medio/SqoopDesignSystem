//
//  SQChannelPlaylistCarouselCell.swift
//  SqoopDesignSystem
//
//  Created by 윤동주 on 10/5/25.
//

import SwiftUI

public struct SQChannelPlaylistCarouselCell: View {
    
    var title: String
    var thumbnailImageUrl: String
    var channelName: String
    public let tapAction: () -> Void
    
    public init(
        title: String,
        thumbnailImageUrl: String,
        channelName: String,
        tapAction: @escaping () -> Void
    ) {
        self.title = title
        self.thumbnailImageUrl = thumbnailImageUrl
        self.channelName = channelName
        self.tapAction = tapAction
    }
    
    public var body: some View {
        Button {
            tapAction()
        } label: {
            CarouselCell(
                thumbnailImageUrl: thumbnailImageUrl,
                title: title,
                channelName: channelName
            )
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(width: 161, height: 164)
    }
}

// MARK: - Default

private struct CarouselCell: View {

    /// 플레이리스트 썸네일
    let thumbnailImageUrl: String
    
    /// 플레이리스트명
    let title: String
    
    /// 채널명
    let channelName: String
    
    var body: some View {
        ZStack {
            Color.bgGrey3
            
            Content()
        }
    }
    
    private func Content() -> some View {
        VStack(alignment: .center, spacing: 0) {
            SQAsyncImage(imageURLString: thumbnailImageUrl, width: 134, height: 78)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 4.66))
            
            Text(channelName)
                .fontWithLineHeight(.body02(weight: .medium))
                .lineLimit(1)
                .multilineTextAlignment(.leading)
                .foregroundStyle(Color.textPrimary)
                .padding(.top, 9)
            
            Text(title)
                .fontWithLineHeight(.caption02)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .foregroundStyle(Color.textSecondary)
            
            Spacer()
        }
        .padding(.top, 8)
        .padding(.leading, 3)
        .frame(width: 92)
    }
}
