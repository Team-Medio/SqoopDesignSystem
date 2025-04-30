//
//  File.swift
//  SqoopDesignSystem
//
//  Created by 김민준 on 3/7/25.
//

import SwiftUI

extension View {
    
    /// AsyncImage를 간편하게 사용하기 위한 함수입니다.
    func asyncImage(_ phase: AsyncImagePhase, placeholder: Image) -> Image {
        phase.image ?? placeholder
    }
}
