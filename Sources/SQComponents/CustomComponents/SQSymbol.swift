//
//  SQSymbol.swift
//  SqoopDesignSystem
//
//  Created by 김민준 on 11/1/24.
//

import SwiftUI
import SqoopDesignSystem

public struct SQSymbol: View {
    
    public let symbol: SFSymbol
    private let size: CGFloat
    
    public init(
        symbol: SFSymbol,
        size: CGFloat = SFSymbol.size
    ) {
        self.symbol = symbol
        self.size = size
    }
    
    public var body: some View {
        Image(symbol: symbol)
            .font(.system(size: size, weight: symbol.weight))
    }
}

// MARK: - Preview

#Preview {
    SQSymbol(symbol: .alert)
}
