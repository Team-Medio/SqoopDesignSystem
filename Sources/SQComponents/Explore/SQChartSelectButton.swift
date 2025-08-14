//
//  SQChartSelectButton.swift
//  SqoopDesignSystem
//
//  Created by 윤동주 on 8/14/25.
//

import SwiftUI

struct SQChartSelectButton: View {
    
    var title: String
    var selected: Bool
    var action: () -> Void
    
    var body: some View {
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
        
    }
}

#Preview {
    SQChartSelectButton(title: "플레이리스트", selected: false) {
        print("SQChartSelectButton 클릭")
    }
}
