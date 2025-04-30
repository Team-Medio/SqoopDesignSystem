//
//  SQDefaultButtonCore.swift
//  Temp
//
//  Created by Greem on 10/29/24.
//

import SwiftUI
import SqoopDesignSystem

public struct SQDefaultButtonCore: View {
    let buttonText: String
    let isActive: Bool
    let action: () -> Void
    let height: CGFloat
    public init(buttonText: String, isActive: Bool, action: @escaping () -> Void, height: CGFloat) {
        self.buttonText = buttonText
        self.isActive = isActive
        self.action = action
        self.height = height
    }
    public var body: some View {
        Button {
            action()
        } label: {
                HStack {
                    Spacer()
                    Text(buttonText)
                        .fontWithLineHeight(.title01(weight: .bold))
                        .foregroundStyle(isActive ? Color.textInverse : Color.textDisabled)
                    Spacer()
                }
            .frame(height: height)
            .frame(minWidth: 343,maxWidth: 408)
            .background(isActive ? Color.bgPrimary : Color.bgDisabled)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .buttonStyle(.plain)
        .interactiveDismissDisabled(true)
    }
}
