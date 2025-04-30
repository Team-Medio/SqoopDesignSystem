//
//  SQCustomAlert.swift
//  SqoopDesignSystem
//
//  Created by 김민준 on 11/8/24.
//

import SwiftUI
import SqoopDesignSystem

public struct SQCustomAlert: View {
    
    public let symbol: SFSymbol
    public let title: String
    public let contents: [String]
    public let buttonTitle: String
    public let buttonAction: () -> Void
    
    public init(
        symbol: SFSymbol,
        title: String,
        contents: [String],
        buttonTitle: String,
        buttonAction: @escaping () -> Void
    ) {
        self.symbol = symbol
        self.title = title
        self.contents = contents
        self.buttonTitle = buttonTitle
        self.buttonAction = buttonAction
    }
    
    public var body: some View {
        ZStack {
            Color.black.opacity(0.6)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Title(symbol: symbol, title: title)
                    .padding(.top, 28)
                
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .foregroundStyle(Color.bgGrey2.opacity(0.4))
                    .padding(.top, 28)
                    .padding(.horizontal, 16)
                
                TipList(contents: contents)
                    .padding(.top, 28)
                    .padding(.horizontal, 16)
                
                Button {
                    buttonAction()
                } label: {
                    Text(buttonTitle)
                        .fontWithLineHeight(.title01(weight: .bold))
                        .foregroundStyle(Color.textInverse)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.bgPrimary)
                        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                }
                .padding(.top, 28)
            }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.bgGrey3)
                    .stroke(Color.bdGrey1.opacity(0.2), lineWidth: 2)
            )
            .frame(maxWidth: 343)
        }
    }
}

// MARK: - Title

private struct Title: View {
    
    let symbol: SFSymbol
    let title: String
    
    var body: some View {
        HStack(spacing: 8) {
            SQSymbol(symbol: symbol, size: 24)
                .foregroundStyle(Color.iconSkyBlue)
            
            Text(title)
                .fontWithLineHeight(.custom(size: 22, weight: .semiBold))
                .foregroundStyle(Color.textPrimary)
        }
    }
}

// MARK: - TipList

private struct TipList: View {
    
    let contents: [String]
    
    var body: some View {
        VStack(spacing: 24) {
            ForEach(contents.indices, id: \.self) { index in
                HStack(alignment: .top, spacing: 8) {
                    if contents.count > 1 {
                        TipIndexCircle(index: index + 1)
                    }
                    
                    Text(contents[index])
                        .fontWithLineHeight(.body01(weight: .regular))
                        .foregroundStyle(Color.textPrimary)
                    
                    Spacer()
                }
            }
        }
    }
}

// MARK: - TipIndexCircle

private struct TipIndexCircle: View {
    
    let index: Int
    
    var body: some View {
        Circle()
            .frame(width: 20, height: 20)
            .foregroundStyle(Color.bgPrimary)
            .overlay {
                Text("\(index)")
                    .fontWithLineHeight(.alert01)
                    .foregroundStyle(Color.textInverse)
            }
    }
}

// MARK: - Preview

#Preview {
    VStack {
        SQCustomAlert(
            symbol: .check,
            title: "팁 제목",
            contents: [
                "팁 첫번째 줄",
                "팁 두번째 줄",
                "팁 세번째 줄",
            ],
            buttonTitle: "확인",
            buttonAction: { }
        )
        SQCustomAlert(
            symbol: .check,
            title: "팁 제목",
            contents: [
                "팁 첫번째 줄"
            ],
            buttonTitle: "확인",
            buttonAction: { }
        )
    }
    .loadSqoopFontSystem()
}
