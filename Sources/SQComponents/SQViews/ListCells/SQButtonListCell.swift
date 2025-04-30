//
//  SQButtonListCell.swift
//  SqoopDesignSystem
//
//  Created by 윤동주 on 11/21/24.
//

import SwiftUI

public struct SQButtonListCell: View {
    
    // MARK: - Properties
    
    public let title: String
    public let action: (() -> Void)?
    
    // MARK: - Initializer

    public init(
        title: String,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        VStack(spacing: 16) {
            Button{
                guard let action = action else { return }
                action()
            } label: {
                HStack {
                    Text(title)
                        .fontWithLineHeight(.body01(weight: .regular))
                        .foregroundStyle(Color.textPrimary)
                    
                    Spacer()
                    
                    SQSymbol(symbol: .arrowRight, size: 16)
                        .foregroundStyle(Color.textPrimary)
                }
            }
            .padding(.horizontal, 8)
            
            Divider()
                .frame(height: 0.1)
                .foregroundStyle(Color.bdWhite)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 54)
        
    }
}

#Preview {
    SQButtonListCell(
        title: "버튼리스트명",
        action: {}
    )
}
