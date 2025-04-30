//
//  PopUpAlertLabel.swift
//  SqoopDesignSystem
//
//  Created by Greem on 11/3/24.
//

import SwiftUI
import SqoopDesignSystem

struct PopUpAlertLabel: View {
    let icon: SFSymbol
    let title: String
    init(icon: SFSymbol, title: String) {
        self.icon = icon
        self.title = title
    }
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: icon.name)
                .font(.system(size: 20,weight: .medium))
            Text(title)
            Spacer()
        }.font(.title01(.semiBold))
            .foregroundStyle(Color.textPrimary)
            .padding(.vertical, 10)
    }
}
