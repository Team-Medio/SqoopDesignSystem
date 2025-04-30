//
//  SQSection.swift
//  SqoopDesignSystem
//
//  Created by 윤동주 on 11/21/24.
//

import SwiftUI

public struct SQSection<Content: View>: View {
    
    public let title: String
    public let content: () -> Content
    
    public init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontWithLineHeight(.body02(weight: .medium))
                .foregroundStyle(Color.textTertiary)
            
            content()
        }
    }
}
