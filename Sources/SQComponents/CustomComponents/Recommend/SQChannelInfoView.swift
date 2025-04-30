//
//  ChannelThumbnail.swift
//  SqoopDesignDemos
//
//  Created by Greem on 11/23/24.
//

import SwiftUI
import SqoopDesignSystem

public struct SQChannelInfoView: View {
    
    public let name: String
    public let thumbnailURLString: String
    public let subscriberCount: Int
    public let channelURLString: String
    public let action: () -> Void
    
    public init(
        name: String,
        thumbnailURLString: String,
        subscriberCount: Int,
        channelURLString: String,
        action: @escaping () -> Void
    ) {
        self.name = name
        self.thumbnailURLString = thumbnailURLString
        self.subscriberCount = subscriberCount
        self.channelURLString = channelURLString
        self.action = action
    }
    
    public var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                ChannelThumbnailButton(thumbnailURLString: thumbnailURLString,action: action)
                ChannelInfoLabel(name: name, subscriberCount: subscriberCount)
                Spacer()
            }
            ChannelInfoLinkButton(channelURLString: channelURLString)
        }
        .frame(maxWidth: 375)
    }
}
