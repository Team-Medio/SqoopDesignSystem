//
//  SQPopupButton.swift
//  Temp
//
//  Created by Greem on 10/29/24.
//

import SwiftUI
import SqoopDesignSystem

public struct SQPopUpButton: View {
    public let title: String
    public let action: ()->Void
    
    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button{ action() } label: {
            HStack {
                Spacer()
                Text(title)
                Spacer()
            }
            .background(Color.clear)
            .foregroundStyle(Color.textBrand).font(.title01(.bold))
            .frame(height: 48)
            .frame(minWidth: 311,maxWidth: 375)
            .contentShape(Rectangle())
            .background{
                GeometryReader { proxy in
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(
                            RadialGradient(stops: .focusRing,
                                           center: UnitPoint(x: 0.2, y: 0.1),
                                           startRadius: 0, endRadius: proxy.size.width),
                            lineWidth: 1.5
                        )
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(
                            RadialGradient(stops: .focusRing,
                                           center: UnitPoint(x: 0.8, y: 0.9),
                                           startRadius: 0, endRadius: proxy.size.width),
                            lineWidth: 1.5
                        )
                }
            }
        }.buttonStyle(.plain)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea(.all)
        SQPopUpButton(title: "버튼명", action: {})
    }
}
