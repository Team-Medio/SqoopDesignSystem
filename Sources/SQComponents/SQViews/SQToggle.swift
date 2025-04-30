//
//  SQToggle.swift
//  SqoopDesignSystem
//
//  Created by 윤동주 on 11/23/24.
//

import SwiftUI

/// 설정 페이지에서 사용되는 Toggle입니다.
struct SQToggle: View {
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                withAnimation {
                    isOn.toggle()
                }
            } label: {
                RoundedRectangle(cornerSize: CGSize(width: 100, height: 100))
                    .frame(width: 51, height: 31)
                    .foregroundColor(isOn ? .bgPrimary : .bgGrey2)
                    .overlay(
                        Circle()
                            .frame(width: 27, height: 27)
                            .foregroundColor(.white)
                            .offset(x: isOn ? 10 : -10)
                            .animation(.easeInOut, value: isOn)
                    )
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}
