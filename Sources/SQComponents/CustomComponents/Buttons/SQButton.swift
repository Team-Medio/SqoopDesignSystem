//
//  SQButton.swift
//  Temp
//
//  Created by Greem on 10/28/24.
//

import SwiftUI
import SqoopDesignSystem

// MARK: -- 테두리 그라데이션이 존재하는 버튼
public struct SQButton: View {
    public let text: String
    public let action: ()->Void
    public init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    public var body: some View {
        Button {
            action()
        } label: {
            Text(text)
        }.buttonStyle(SQButtonStyle())
    }
    
    private struct SQButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.headline03(.semiBold))
                .foregroundStyle(
                    configuration.isPressed ? Color.textPressed : Color.textBrand
                )
                .frame(height: 56)
                .padding(.horizontal,28)
                .modifier(SQButtonBorder(isPressed: configuration.isPressed))
                .offset(x: 0,y: configuration.isPressed ? 1 : 0)
        }
        func gradientStops(isPress: Bool)->[Gradient.Stop] {
            !isPress ? [
                .init(color: Color(hex: "#656565").opacity(0.4), location: 0.0),
                .init(color: Color(hex: "#0ED0DB"), location: 0.5),
                .init(color: Color(hex: "#656565").opacity(0.4), location: 1)
            ] : [
                .init(color: Color(hex: "#000000").opacity(0.3), location: 0.0),
                .init(color: Color.textPressed, location: 0.5),
                .init(color: Color(hex: "#656565").opacity(0.3), location: 1)
            ]
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea(.all)
        SQButton(text: "버튼명", action: {})
    }.background(.black)
        .ignoresSafeArea(.all)
        .loadSqoopFontSystem()
}
