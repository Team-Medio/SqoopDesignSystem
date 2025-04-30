//
//  ChannelThumbnailButton.swift
//  SqoopDesignDemos
//
//  Created by Greem on 11/23/24.
//

import SwiftUI
import SqoopDesignSystem

struct ChannelThumbnailButton: View {
    let thumbnailURLString: String
    let action: () -> Void
    private let size = CGFloat(50)
    var body: some View{
        Group {
            if let url = URL(string: thumbnailURLString) {
                AsyncImage(url: url, scale: 50) { content in
                    switch content {
                    case .empty:
                        Image(.emptyMusic)
                            .resizable()
                            .squareFrame(size: size)
                            .clipShape(Circle())
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .squareFrame(size: size)
                            .clipShape(Circle())
                    case .failure:
                        Image(.emptyMusic)
                            .resizable()
                            .squareFrame(size: size)
                            .clipShape(Circle())
                    @unknown default:
                        Image(.emptyMusic)
                            .resizable()
                            .squareFrame(size: size)
                            .clipShape(Circle())
                    }
                }.squareFrame(size: size)
            } else {
                Image(.emptyMusic)
                    .resizable()
                    .squareFrame(size: size)
                    .clipShape(Circle())
            }
        }
        .onTapGesture {
            action()
        }
    }
}


fileprivate extension View {
    func squareFrame(size: CGFloat) -> some View {
        self.frame(width: size, height: size)
    }
}
