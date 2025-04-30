//
//  SQWritingSet.swift
//  Temp
//
//  Created by Greem on 10/30/24.
//

import SwiftUI
import SqoopDesignSystem

/// 메인 정보 표시에서 사용하는 텍스트 뷰입니다.
public struct SQMainWriting: View {
    
    public var mainDesc: String?
    public var mainDesc2: String?
    public var subDesc: String?
    public var subDesc2: String?
    
    public init (
        mainDesc: String? = nil,
        mainDesc2: String? = nil,
        subDesc: String? = nil,
        subDesc2: String? = nil
    ) {
        self.mainDesc = mainDesc
        self.mainDesc2 = mainDesc2
        self.subDesc = subDesc
        self.subDesc2 = subDesc2
    }
    
    public var body: some View {
        VStack(spacing: 10) {
            VStack(spacing: 6) {
                if let mainDesc { Text(mainDesc) }
                if let mainDesc2 { Text(mainDesc2) }
            }
            .font(.headline01)
            .foregroundStyle(Color.textSecondary)
            .lineLimit(2)
            .multilineTextAlignment(.center)
            
            VStack(spacing: 6) {
                if let subDesc { Text(subDesc)}
                if let subDesc2 { Text(subDesc2)}
            }
            .font(.body01(.semiBold))
            .foregroundStyle(Color.textSecondary)
            .multilineTextAlignment(.center)
        }
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        Color.black.ignoresSafeArea(.all)
        SQMainWriting(mainDesc: "ㅎㅇㅎㅇㅎ", subDesc: "ㅎㅇㅎ")
    }
    .loadSqoopFontSystem()
}
