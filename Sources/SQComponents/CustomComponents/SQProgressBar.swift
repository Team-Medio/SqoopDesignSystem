//
//  SQProgress.swift
//  Sqoop
//
//  Created by Greem on 10/11/24.
//

import SwiftUI
import SqoopDesignSystem

/// 진행 중인 정보를 표시하는 프로그래스 바입니다.
public struct SQProgressBar: View {
    @Binding var value: Double
    public init(value: Binding<Double>) {
        self._value = value
    }
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .fill(Color.white)
                .frame(height: 4)
            
            ProgressView(value: value)
                .frame(height: 4)
                .tint(Color.bgPrimary)
                .progressViewStyle(.linear)
                .clipShape(RoundedRectangle(cornerRadius: 2)) // 둥근 끝 모양을 위해 클립
        }
    }
}

#Preview {
    @Previewable @State var value: Double = 0.4
    SQProgressBar(value: $value)
}
