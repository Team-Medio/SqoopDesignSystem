//
//  File.swift
//  SqoopDesignSystem
//
//  Created by TEO on 11/25/24.
//

import SwiftUI


public struct SQIndicatorBar: View {
    public init() { }
    
    public var body: some View {
        RoundedRectangle(cornerRadius: 3)
            .fill(Color.bgGrey1)
            .frame(width: 80, height: 5)
            .padding(.vertical, 14)
    }
}
