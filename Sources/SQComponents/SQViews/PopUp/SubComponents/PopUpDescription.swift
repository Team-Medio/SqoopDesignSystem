//
//  File.swift
//  SqoopDesignSystem
//
//  Created by Greem on 11/3/24.
//

import SwiftUI
import SqoopDesignSystem

struct PopUpDescription: View {
    let popUpDesc: String
    var body: some View {
        Text(popUpDesc.trimmingCharacters(in: ["\n"]))
            .multilineTextAlignment(.center)
            .lineSpacing(8)
            .foregroundStyle(Color.textSecondary)
            .font(.caption01)
    }
}
