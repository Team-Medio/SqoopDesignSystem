//
//  SQChartSelectButton.swift
//  SqoopDesignSystem
//
//  Created by 윤동주 on 8/14/25.
//

import SwiftUI

public struct SQChartSelectButton: View {
    
    public var title: String
    public var selected: Bool
    public var action: () -> Void
    
    public init(
        title: String,
        selected: Bool,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.selected = selected
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .padding(.vertical, 6)
                .padding(.horizontal, 12)
                .foregroundStyle(selected ? Color.textBrand : Color.textSecondary)
                .background(
                    RoundedRectangle(
                        cornerRadius: 20,
                        style: .continuous
                    )
                    .stroke(selected ? Color.textBrand : Color.bdGrey1, lineWidth: 1)
                )
        }
        .disabled(!selected)
    }
}

#Preview {
    SQChartSelectButton(title: "플레이리스트", selected: true) {
        print("SQChartSelectButton 클릭")
    }
}
