//
//  File.swift
//  SqoopDesignSystem
//
//  Created by Greem on 11/21/24.
//


import SwiftUI
import SqoopDesignSystem

// MARK: -- 테두리 그라데이션이 존재하는 버튼
public struct SQAccentButton: View {
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
        }.buttonStyle(SQAccentButtonStyle())
    }
    
    private struct SQAccentButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.headline03(.semiBold))
                .foregroundStyle(
                    configuration.isPressed ? Color.textTertiary : Color.textPrimary
                )
                .frame(height: 56)
                .padding(.horizontal,28)
                .background{
                    GeometryReader { proxy in
                        ZStack{
                            Capsule()
                                .strokeBorder(
                                    RadialGradient(
                                        stops: self.gradientStops(isPress: configuration.isPressed),
                                        center: {
                                            var center: UnitPoint = .topLeading
                                            center.x += 0.25
                                            center.y += 0.25
                                            return center
                                        }(),
                                        startRadius: 0,
                                        endRadius: proxy.size.width ),
                                    lineWidth: 1.5
                                )
                        }
                    }.frame(maxWidth: 200).clipShape(Capsule())
                }
                .background {
                    LinearGradient(
                        stops: bgGradientStops(isPress: configuration.isPressed),
                        startPoint: UnitPoint(x: -0.8, y: 0.5),
                        endPoint: UnitPoint(x: 0.9, y: 0.5)
                    )
                    .frame(maxWidth: 200)
                    .opacity(0.8)
                    .clipShape(Capsule())
                }
                .offset(x: 0,y: configuration.isPressed ? 1 : 0)
        }
        
        func bgGradientStops(isPress: Bool) -> [Gradient.Stop] {
            !isPress ? [
                .init(color: Color(hex: "#27F3FF").opacity(0.7), location: 0),
                .init(color: Color(hex: "174F53"), location: 1),
            ] : [
                .init(color: Color(hex: "#174F53"), location: 0),
                .init(color: Color(hex: "#001D21"), location: 1),
            ]
        }
        
        func gradientStops(isPress: Bool)->[Gradient.Stop] {
            !isPress ? [
                .init(color: Color(hex: "#656565").opacity(0.4), location: 0.0),
                .init(color: Color(hex: "#0ED0DB"), location: 0.5),
                .init(color: Color(hex: "#656565").opacity(0.4), location: 1)
            ] : [
                .init(color: Color(hex: "#000000").opacity(0.3), location: 0.0),
                .init(color: Color(hex: "#009EA9"), location: 0.5),
                .init(color: Color(hex: "#656565").opacity(0.3), location: 1)
            ]
        }
    }
}
