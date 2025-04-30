//
//  SQPaginationDot.swift
//  SqoopDesignSystem
//
//  Created by 김민준 on 11/1/24.
//

import SwiftUI

public struct SQPaginationDot: View {
    
    public let pageCount: Int
    public let currentPage: Int
    
    public init(pageCount: Int, currentPage: Int) {
        self.pageCount = pageCount
        self.currentPage = currentPage
    }
    
    /// 페이지 최대 개수 제한을 위한 계산 속성
    private var maxPageCount: Int {
        return min(pageCount, 5)
    }
    
    public var body: some View {
        HStack(spacing: 16) {
            ForEach(0..<maxPageCount, id: \.self) { index in
                Dot(isActive: index == currentPage)
            }
        }
    }
}

// MARK: - SQPaginationDot

private struct Dot: View {
    
    let isActive: Bool
    
    /// Dot 사이즈
    private var size: CGFloat {
        return 10
    }
    
    var body: some View {
        Circle()
            .frame(width: size, height: size)
            .foregroundStyle(isActive ? Color.iconSkyBlue : Color.bgGrey250)
    }
}

// MARK: - Preivew

#Preview {
    SQPaginationDot(
        pageCount: 3,
        currentPage: 0
    )
}
