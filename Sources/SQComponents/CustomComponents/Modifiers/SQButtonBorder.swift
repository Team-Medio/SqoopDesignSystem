//
//  SQButtonBorder.swift
//  SqoopDesignSystem
//
//  Created by Greem on 11/21/24.
//

import Foundation
import SwiftUI
import SqoopDesignSystem

struct SQButtonBorder: ViewModifier {
    var isPressed: Bool
    func body(content: Content) -> some View {
        content.background{
            GeometryReader { proxy in
                ZStack{
                    if isPressed {
                        Capsule()
                            .fill(Color(hex: "#000000")
                                .shadow(.inner(color: Color(hex: "#BFBFBF")
                                    .opacity(0.33),radius: 10, x: 0, y: 0)
                                ))
                            .blur(radius: 10)
                    }
                    Capsule()
                        .strokeBorder(
                            RadialGradient(
                                stops:
                                    self.gradientStops(isPress: isPressed),
                                center: {
                                    var center: UnitPoint = .topLeading
                                    center.x += 0.25
                                    center.y += 0.25
                                    return center
                                }(),
                                startRadius: 0,
                                endRadius: proxy.size.width
                            ),
                            lineWidth: 1.5
                        )
                }
            }
            .frame(maxWidth: 200)
            .clipShape(Capsule())
        }
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
