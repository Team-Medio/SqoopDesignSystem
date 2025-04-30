//
//  DisclosurePopUpAlertLabel.swift
//  SqoopDesignSystem
//
//  Created by Greem on 11/3/24.
//

import SwiftUI
import SqoopDesignSystem

struct DisclosurePopUpAlertLabel: View {
    
    let icon: SFSymbol
    let title: String
    
    @Binding var isExpanded: Bool
    
    public init(icon: SFSymbol, title: String, isExpanded: Binding<Bool>) {
        self.icon = icon
        self.title = title
        self._isExpanded = isExpanded
    }
    
    var body: some View {
        HStack(spacing: 6) {
            Image(symbol: icon)
                .font(.system(size: 20,weight: .medium))
            
            Text(title)
            
            Spacer()
            
            Image(symbol: .arrowDown)
                .font(.system(size: 16,weight: .medium))
                .foregroundStyle(Color.textPrimary)
                .rotationEffect(.degrees(isExpanded ? -180 : 0))
        }
        .font(.title01(.semiBold))
        .foregroundStyle(Color.textPrimary)
        .padding(.top, 14).padding(.bottom, 12)
        .padding(.horizontal, 16)
        .background(isExpanded ? Color.bgGrey2 : Color.bgGrey3)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .onTapGesture {
            withAnimation { isExpanded.toggle() }
        }
    }
}
