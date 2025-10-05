//
//  SQChannelCarouselCell.swift
//  SqoopDesignSystem
//
//  Created by 윤동주 on 8/14/25.
//

import SwiftUI

public struct SQChannelCarouselCell: View {
    
    public enum Variant {
        case `default`(
            ranking: Int,
            title: String,
            thumbnailImageUrl: String,
            sqoopCount: Int
        )
        case more
    }
    
    public let variant: Variant
    public let tapAction: () -> Void
    
    public init(
        variant: Variant,
        tapAction: @escaping () -> Void
    ) {
        self.variant = variant
        self.tapAction = tapAction
    }
    
    public var body: some View {
        Button {
            tapAction()
        } label: {
            switch variant {
            case let .default(ranking, title, thumbnailImageUrl, sqoopCount):
                Default(ranking: ranking, thumbnailImageUrl: thumbnailImageUrl, title: title, sqoopCount: sqoopCount)
                
            case .more:
                More()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .frame(width: 148, height: 180)
    }
}

// MARK: - Default

private struct Default: View {
    /// 채널 차트 랭킹
    let ranking: Int

    /// 채널 썸네일
    let thumbnailImageUrl: String
    
    /// 채널명
    let title: String
    
    /// 누적스쿱 횟수
    let sqoopCount: Int
    
    var body: some View {
        ZStack {
            Color.bgGrey3
            
            Content()
                .padding([.top, .leading], 8)
            
            Text("\(ranking)")
                .foregroundStyle(Color.textPrimary)
                .font(.system(size: 32, weight: .bold))
                .italic()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(8)
        }
    }
    
    private func Content() -> some View {
        VStack(alignment: .center, spacing: 0) {
            SQAsyncImage(imageURLString: thumbnailImageUrl, width: 92, height: 92)
                .frame(width: 148, height: 92)
                .frame(width: 92, height: 92)
                .clipped()
                .clipShape(Circle())
                .contentShape(Circle())
            
            Text(title)
                .fontWithLineHeight(.body02(weight: .medium))
                .lineLimit(1)
                .multilineTextAlignment(.leading)
                .foregroundStyle(Color.textPrimary)
                .padding(.top, 14)
            
            Text("누적스쿱 \(sqoopCount)회")
                .fontWithLineHeight(.caption01)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .foregroundStyle(Color.textTertiary)
            
            Spacer()
        }
        .padding(.top, 8)
        .padding(.leading, 3)
        .frame(width: 92)
    }
}

// MARK: - More

private struct More: View {
    
    var body: some View {
        ZStack {
            Overlay()
            
            VStack(spacing: 6) {
                Image(symbol: .arrowRightCircle)
                    .font(.system(size: 36))
                
                Text("더 보러가기")
                    .fontWithLineHeight(.headline02)
                    
            }
            .foregroundStyle(Color.textBrand)
        }
    }
    
    private func Overlay() -> some View {
        Rectangle()
            .foregroundColor(.clear)
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color.bgGreyTransparent1, location: 0.00),
                        Gradient.Stop(color: Color(red: 0.05, green: 0.13, blue: 0.16), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: -0.16, y: 0.75),
                    endPoint: UnitPoint(x: 1, y: 0.13)
                )
            )
    }
}
