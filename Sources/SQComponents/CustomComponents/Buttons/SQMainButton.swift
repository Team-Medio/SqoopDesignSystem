//
//  SQMainButton.swift
//  Temp
//
//  Created by Greem on 10/29/24.
//

import SwiftUI
import SqoopDesignSystem
public struct SQMainButton: View {
    
    public let buttonText: String
    public let isActive: Bool
    public let action: () -> Void
    
    public init(buttonText: String,
                isActive: Bool,
                action: @escaping () -> Void) {
        self.buttonText = buttonText
        self.isActive = isActive
        self.action = action
    }
    public var body: some View {
        SQDefaultButtonCore(
            buttonText: buttonText,
            isActive: isActive,
            action: action,
            height: 56
        )
    }
}
