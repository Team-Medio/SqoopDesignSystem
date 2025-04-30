//
//  SQExtractingWritingSet.swift
//  Temp
//
//  Created by Greem on 10/30/24.
//

import SwiftUI
import SqoopDesignSystem

/// 추출 중 정보 표시에서 사용하는 텍스트 뷰입니다.
public struct SQExtractingWritingSet: View {
    public let minutes: Int
    @State private var task: Task<(), Never>?
    @State private var descNum: Int = 0
    public init(minutes: Int) {
        self.minutes = minutes
    }
    public var body: some View {
        SQMainWriting(mainDesc: "It will take".localized(with: [minutes]),
                      mainDesc2: "about N minutes".localized(with: [minutes]),
                      subDesc: "Extracting\(descNum)1".localized,
                      subDesc2: "Extracting\(descNum)2".localized
        )
        .onAppear {
            task = Task {
                while true {
                    try? await Task.sleep(for: .seconds(5))
                    await MainActor.run {
                        withAnimation {
                            descNum = (descNum + 1) % 3
                        }
                    }
                }
            }
        }
        .onDisappear() {
            task?.cancel()
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SQExtractingWritingSet(minutes: 4).loadSqoopFontSystem()
    }
}
