//
//  File.swift
//  SqoopDesignSystem
//
//  Created by Greem on 10/28/24.
//

import SwiftUI

extension View {
    /// Attach this to any Xcode Preview's view to have custom fonts displayed
    /// Note: Not needed for the actual app
    public func loadSqoopFontSystem() -> some View {
        SQFontManager.shared.registerFonts()
        return self
    }
}

extension View {
    @MainActor
    public func sqoopBackground() -> some View {
        self.background{
            GeometryReader { proxy in
                LinearGradient(stops: .background, startPoint: .top, endPoint: .bottom)
                    .frame(height: proxy.size.height * 1.2)
                    .ignoresSafeArea(.all)
            }
        }
    }
}
