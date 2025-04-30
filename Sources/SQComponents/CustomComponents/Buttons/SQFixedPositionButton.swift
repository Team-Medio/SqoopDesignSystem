//
//  SQFixedPositionButton.swift
//  Sqoop
//
//  Created by 김민준 on 10/14/24.
//

import SwiftUI
import SqoopDesignSystem

public struct SQFixedPositionButton: View {
    
    public let isActive: Bool
    public let buttonText: String
    public let action: () -> Void
    
    public init(
        isActive: Bool,
        buttonText: String,
        action: @escaping () -> Void
    ) {
        self.isActive = isActive
        self.buttonText = buttonText
        self.action = action
    }
    
    public var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(Material.bar)
                .frame(maxWidth: .infinity)
                .preferredColorScheme(.dark)
            
            SQMainButton(
                buttonText: buttonText,
                isActive: isActive,
                action: action
            )
            .padding(.top, 16)
            .padding(.horizontal, 16)
        }
        .frame(height: 108)
        .frame(minWidth: 375, maxWidth: 440)
    }
}
