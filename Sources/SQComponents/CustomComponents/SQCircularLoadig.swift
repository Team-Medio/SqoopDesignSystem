//
//  SQCircularLoadig.swift
//  SqoopDesignSystem
//
//  Created by 김민준 on 11/4/24.
//

import SwiftUI

// MARK: - View Extension

public extension View {
    @ViewBuilder func circularLoading(_ isActive: Bool) -> some View {
        modifier(SQCircularLoadigViewModifier(isActive: isActive))
    }
}

// MARK: - SQCircularLoadigViewModifier

public struct SQCircularLoadigViewModifier: ViewModifier {
    
    let isActive: Bool
    
    public func body(content: Content) -> some View {
        content
            .overlay {
                if isActive {
                    ZStack {
                        Color.bgGrey2.opacity(0.5).ignoresSafeArea()
                        SQCircularLoadig()
                    }
                }
            }
    }
}

// MARK: - SQCircularLoadig

private struct SQCircularLoadig: View {
    
    @State private var rotationAngle = 0.0
    
    private let ringSize: CGFloat = 58
    private let lineWidth: CGFloat = 6
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(
                    Color.iconSkyBlue,
                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                )
                .frame(width: ringSize, height: ringSize)
            
            Circle()
                .frame(width: lineWidth, height: lineWidth)
                .foregroundColor(.iconSkyBlue)
                .offset(x: ringSize / 2)
        }
        .rotationEffect(.degrees(rotationAngle))
        .padding(.horizontal, 80)
        .padding(.vertical, 50)
        .onAppear {
            withAnimation(.linear(duration: 1.5)
                .repeatForever(autoreverses: false)) {
                    rotationAngle = 360.0
                }
        }
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        Text("테스트 메시지")
            .font(.system(size: 24, weight: .bold))
            .foregroundStyle(.white)
    }
    .circularLoading(true)
}
