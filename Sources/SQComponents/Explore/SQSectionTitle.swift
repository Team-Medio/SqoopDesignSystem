//
//  SQSectionTitle.swift
//  SqoopDesignSystem
//
//  Created by 김민준 on 3/4/25.
//

import SwiftUI

public struct SQSectionTitle: View {
    
    public let updateLabel: String
    public let mainTitle: String
    public let subDescription: String
    public let isShowTip: Bool
    public let tipIconTapped: () -> Void
    public let arrowIconTapped: () -> Void
    
    public init(
        updateLabel: String,
        mainTitle: String,
        subDescription: String,
        isShowTip: Bool = false,
        tipIconTapped: @escaping () -> Void = {},
        arrowIconTapped: @escaping () -> Void
    ) {
        self.updateLabel = updateLabel
        self.mainTitle = mainTitle
        self.subDescription = subDescription
        self.isShowTip = isShowTip
        self.tipIconTapped = tipIconTapped
        self.arrowIconTapped = arrowIconTapped
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(updateLabel)
                .fontWithLineHeight(.body02(weight: .regular))
                .foregroundStyle(Color.textBrand)
            
            HStack(spacing: 8) {
                Text(mainTitle)
                    .fontWithLineHeight(.headline01)
                    .foregroundStyle(Color.textPrimary)
                
                if isShowTip {
                    Button {
                        tipIconTapped()
                    } label: {
                        Image(symbol: .tip)
                            .foregroundStyle(Color.textSecondary)
                    }
                }
                
                Spacer()
                
                Button {
                    arrowIconTapped()
                } label: {
                    Image(symbol: .arrowRight)
                        .font(.system(size: 23, weight: .regular))
                        .foregroundStyle(Color.textSecondary)
                }
            }
            .padding(.top, 4)
            
            Text(subDescription)
                .fontWithLineHeight(.custom(size: 14, weight: .regular))
                .foregroundStyle(Color.textSecondary)
                .padding(.top, 10)
        }
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        Color.bdBlack.ignoresSafeArea()
        SQSectionTitle(
            updateLabel: "2월 1주차",
            mainTitle: "메인타이틀",
            subDescription: "서브설명입니다.",
            isShowTip: true,
            tipIconTapped: {},
            arrowIconTapped: {}
        )
        .loadSqoopFontSystem()
    }
}
