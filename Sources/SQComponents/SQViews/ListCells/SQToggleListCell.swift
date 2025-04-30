//
//  SQToggleListCell.swift
//  Sqoop
//
//  Created by Greem on 10/10/24.
//

import SwiftUI
import SqoopDesignSystem

public struct SQToggleListCell: View {
    
    // MARK: - Properties
    
    public let title: String
    @Binding public var isOn: Bool
    
    // MARK: - Initializer
    
    public init(
        title: String,
        isOn: Binding<Bool>
    ) {
        self.title = title
        self._isOn = isOn
    }
    
    public var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text(title)
                    .fontWithLineHeight(.body01(weight: .regular))
                    .foregroundStyle(Color.textPrimary)
                    .layoutPriority(1)
                
                Spacer()
                
                SQToggle(isOn: $isOn)
            }
            .padding(.leading, 8)
            
            Divider()
                .frame(height: 0.1)
                .foregroundStyle(Color.bdWhite)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 54)
        
    }
}

// MARK: - Preview

#Preview {
    SQToggleListCell(
        title: "토글리스트명",
        isOn: .constant(true)
    )
    
}
