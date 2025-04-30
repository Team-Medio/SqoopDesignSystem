//
//  SQPlaylistCarouselCell.swift
//  SqoopDesignSystem
//
//  Created by 김민준 on 3/4/25.
//

import SwiftUI

public struct SQPlaylistCarouselCell: View {
    
    public enum Variant {
        case `default`(ranking: Int, title: String, thumbnailImageUrl: String)
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
            case let .default(ranking, title, thumbnailImageUrl):
                Default(ranking: ranking, title: title, thumbnailImageUrl: thumbnailImageUrl)
                
            case .more:
                More()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .frame(width: 300, height: 180)
    }
}

// MARK: - Default

private struct Default: View {
    
    let ranking: Int
    let title: String
    let thumbnailImageUrl: String
    
    var body: some View {
        ZStack {
            SQAsyncImage(imageURLString: thumbnailImageUrl, width: 300, height: 180)
            Overlay()
            Content()
                .padding(16)
        }
    }
    
    private func Overlay() -> some View {
        Rectangle()
            .foregroundColor(.clear)
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: .black.opacity(0), location: 0.00),
                        Gradient.Stop(color: .black.opacity(0.7), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 1)
                )
            )
    }
    
    private func Content() -> some View {
        VStack(alignment: .leading) {
            Text("\(ranking)")
                .foregroundStyle(Color.textPrimary)
                .font(.system(size: 40, weight: .bold, design: .none))
                .italic()
            
            Spacer()
            
            HStack {
                Text(title)
                    .fontWithLineHeight(.body01(weight: .semiBold))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(Color.textPrimary)
                
                Spacer()
            }
        }
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
