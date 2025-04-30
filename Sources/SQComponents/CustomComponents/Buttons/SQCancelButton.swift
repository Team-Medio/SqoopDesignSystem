//
//  SQCancelButton.swift
//  DesignSystem
//
//  Created by Greem on 10/30/24.
//

import SwiftUI
import SqoopDesignSystem

public struct SQCancelButton: View {
    
    // MARK: - Properties

    public let label: LabelItem
    public let action: ()->Void
    
    // MARK: - Initializer

    public init(title: String, symbol: SFSymbol?, action: @escaping () -> Void) {
        self.label = LabelItem(icon: symbol, title: title)
        self.action = action
    }
    
    public init(label: LabelItem, action: @escaping ()->Void) {
        self.label = label
        self.action = action
    }
    
    // MARK: - BODY

    public var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 2) {
                ContentView()
            }
        }.buttonStyle(SQButtonStyle())
    }
    
    private struct SQButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .foregroundStyle(
                    configuration.isPressed ? Color.textTertiary : Color.textPrimary
                )
                .frame(height: 46)
                .padding(.horizontal,20)
                .background{
                    GeometryReader { proxy in
                        ZStack {
                            if configuration.isPressed {
                                Capsule()
                                    .fill(Color(hex: "#000000")
                                    .shadow(.inner(color: Color(hex: "#BFBFBF")
                                        .opacity(0.33),radius: 10, x: 0, y: 0)
                                    ))
                                .blur(radius: 10)
                            }
                            
                            Capsule()
                                .strokeBorder(
                                    RadialGradient(stops: gradientStops(isPress: configuration.isPressed),
                                                   center: UnitPoint(x: 0.2, y: 0.2), startRadius: 0, endRadius: proxy.size.width ),
                                    lineWidth: 1.5
                                ).opacity(0.7)
                        }
                    }.frame(maxWidth: 200).clipShape(Capsule())
                }.offset(x: 0,y: configuration.isPressed ? 1 : 0)
        }
        
        private func gradientStops(isPress: Bool) -> [Gradient.Stop] {
            !isPress ? [
                .init(color: Color(hex: "#656565").opacity(0.3), location: 0),
                .init(color: Color(hex: "#FFFFFF").opacity(0.6), location: 0.5),
                .init(color: Color(hex: "#656565").opacity(0.4), location: 1)
            ] : [
                .init(color: Color(hex: "#000000").opacity(0.2), location: 0),
                .init(color: Color.textTertiary.opacity(0.6), location: 0.5),
                .init(color: Color(hex: "#656565").opacity(0.3), location: 1)
            ]
        }
    }
    
    @ViewBuilder
    fileprivate func ContentView() -> some View {
        if let icon = label.icon {
            Image(systemName: icon.name)
                .font(.system(size: 16))
                .frame(width: 22,height: 22)
            Text(label.title).font(.body01(.regular))
        } else {
            Text(label.title).font(.body01(.regular))
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SQCancelButton(title: "취소", symbol: .cancel, action: {}).loadSqoopFontSystem()
    }
}
