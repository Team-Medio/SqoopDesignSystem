//
//  SQFixedPositionRemoveButton.swift
//  Temp
//
//  Created by Greem on 10/29/24.
//

import SwiftUI
import SqoopDesignSystem

public struct SQFixedPositionRemoveButton: View {
    public let action: ()->Void
    public init(action: @escaping () -> Void) {
        self.action = action
    }
    public var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(Color.bgGrey3)
                .frame(maxWidth: .infinity)
                .preferredColorScheme(.dark)
            DeleteButton(action: action)
            .padding(.top, 9)
            .padding(.horizontal, 16)
        }
        .frame(height: 108)
        .frame(minWidth: 375,maxWidth: 440)
    }
    
    struct DeleteButton: View {
        let action:()->Void
        
        var body: some View {
            Button {
                action()
            } label: {
                VStack(spacing: 7) {
                    Image(systemName: "trash")
                        .font(Font.system(size: 22))
                    Text("Delete".localized).font(.body01(.medium))
                }.foregroundStyle(Color.textBrand)
                    .frame(height: 56)
                    .padding(.all,10)
                    .contentShape(Rectangle())
            }.buttonStyle(.plain)
        }
    }
}


#Preview {
    SQFixedPositionRemoveButton(action: {})
}
