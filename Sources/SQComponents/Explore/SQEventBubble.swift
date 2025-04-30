//
//  SQEventBubble.swift
//  SqoopDesignSystem
//
//  Created by 김민준 on 3/4/25.
//

import SwiftUI
import SqoopDesignSystem

public struct SQEventBubble: View {
    
    public let title: String
    
    public init(title: String) {
        self.title = title
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .foregroundStyle(.black)
                .fontWithLineHeight(.body01(weight: .semiBold))
                .padding(.horizontal, 12)
                .frame(height: 30)
                .background(Color.iconSkyBlue)
                .clipShape(RoundedRectangle(cornerRadius: 18))
            
            BottomTailShape()
                .fill(Color.iconSkyBlue)
                .frame(width: 10, height: 8)
        }
    }
    
    private struct BottomTailShape: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            let start = CGPoint(x: rect.minX, y: rect.minY)
            path.move(to: start)
            path.addLine(to: start)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addArc(
                tangent1End: .init(x: rect.midX, y: rect.maxY),
                tangent2End: start,
                radius: 1.5
            )
            return path
        }
    }
}

// MARK: - Preview

#Preview {
    SQEventBubble(title: "NEW!")
        .loadSqoopFontSystem()
}
