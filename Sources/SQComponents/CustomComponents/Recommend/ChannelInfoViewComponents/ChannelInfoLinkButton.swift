//
//  ChannelInfoLinkButton.swift
//  SqoopDesignDemos
//
//  Created by Greem on 11/23/24.
//

import SwiftUI
import SqoopDesignSystem

struct ChannelInfoLinkButton: View{
    let channelURLString: String
    @Environment(\.openURL) var openURL
    var body: some View{
        Button {
            if let url = URL(string: channelURLString) {
                openURL(url)
            }
        } label: {
            HStack(spacing: 0) {
                Spacer()
                HStack(spacing: 10) {
                    Image("YoutubeIcon").resizable().frame(width: 22,height: 16)
//                    Image(string:.youtubeIcon).resizable().frame(width: 22,height: 16)
                    Text("YouTube로 이동".localized)
                        .font(Font.custom(by: .pretendard, weight: .semiBold, size: 14))
                        .foregroundStyle(Color.textPrimary)
                }
                Spacer()
            }.padding(.vertical, 11.5)
            .modifier(ChannelInfoButtonViewStyle())
            .frame(height: 45)
            .frame(maxWidth: 375)
        }
    }
}

fileprivate struct ChannelInfoButtonViewStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.background{
            GeometryReader { proxy in
                Capsule().strokeBorder(
                    RadialGradient(
                        stops: GradientStops.playlistGradient,
                        center: {
                            var center: UnitPoint = .topLeading
                            center.x += 0.2
                            center.y += 0.05
                            return center
                        }(),
                        startRadius: 0,
                        endRadius: proxy.size.width ).opacity(0.3)
                )
            }
        }.background {
            GeometryReader { proxy in
                Capsule().strokeBorder(
                    RadialGradient(
                        stops: GradientStops.playlistGradient,
                        center: {
                            var center: UnitPoint = .topLeading
                            center.x += 0.3
                            center.y += -0.5
                            return center
                        }(),
                        startRadius: 0,
                        endRadius: proxy.size.width ).opacity(0.3)
                )
            }
        }
    }
}
