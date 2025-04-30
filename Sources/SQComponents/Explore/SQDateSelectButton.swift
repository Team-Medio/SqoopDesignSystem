//
//  SQDateSelectButton.swift
//  SqoopDesignSystem
//
//  Created by 김민준 on 3/4/25.
//

import SwiftUI

public struct SQDateSelectButton: View {
    
    public let selectedDateLabel: String
    
    public init(selectedDateLabel: String) {
        self.selectedDateLabel = selectedDateLabel
    }
    
    public var body: some View {
        HStack(spacing: 4) {
            Text(selectedDateLabel)
                .fontWithLineHeight(.custom(size: 16, weight: .regular))
            
            Image(symbol: .dateSelector)
        }
        .foregroundStyle(Color.textBrand)
        .frame(height: 44)
    }
}

// MARK: - Preview

#Preview {
    SQDateSelectButton(selectedDateLabel: "2월 1주차")
        .loadSqoopFontSystem()
}
