//
//  PlaylistCommentCellView.swift
//  SqoopDesignDemos
//
//  Created by Greem on 11/23/24.
//

import SwiftUI
import SqoopDesignSystem

public struct SQPlaylistCommentCellView: View {
    
    public let userThumbnailURLString: String
    public let userName: String
    public let likesCount: Int
    public let comment: String
    
    public init(
        userThumbnailURLString: String,
        userName: String,
        likesCount: Int,
        comment: String
    ) {
        self.userThumbnailURLString = userThumbnailURLString
        self.userName = userName
        self.likesCount = likesCount
        self.comment = comment
    }
    
    public var body: some View {
        VStack(spacing: 12) {
            HStack {
                HStack(spacing: 6) {
                    AsyncImage(url: URL(string: userThumbnailURLString)) { image in
                        image
                            .resizable()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                    } placeholder: {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(Color.bgGrey2)
                    }
                    
                    Text(userName)
                        .font(.body02(.medium))
                        .foregroundStyle(Color.textSecondary)
                }
                Spacer()
                HStack(spacing: 5) {
                    Image(systemName: "hand.thumbsup.fill")
                        .font(.system(size: 13)).frame(width: 13,height: 20)
                    
                    Text(likesCount.sqNumeralSystem()).font(.caption01)
                }.foregroundStyle(Color.textTertiary)
                    .frame(height: 30)
            }.frame(height: 30)
            
            HStack {
                Text(comment)
                    .lineLimit(2)
                    .font(.caption01)
                    .foregroundStyle(Color.textSecondary)
                
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 19)
        .padding(.bottom, 27)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.bgGreyTransparent2))
        .frame(maxWidth: 375)
    }
}
