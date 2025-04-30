//
//  SQToastMessage.swift
//  SqoopDesignSystem
//
//  Created by 김민준 on 11/1/24.
//

import SwiftUI
import SqoopDesignSystem

public struct SQToastMessage: View {
    
    public enum ComponentType {
        case onlyMainDescription(mainDescription: String)
        case mainDescriptionWithSubDescription(
            mainDescription: String,
            subDescription: String,
            subDescriptionChevronAction: (() -> Void)? = nil
        )
    }
    
    public let leadingIcon: SFSymbol
    public let componentType: ComponentType
    
    public init(
        leadingIcon: SFSymbol,
        componentType: ComponentType
    ) {
        self.leadingIcon = leadingIcon
        self.componentType = componentType
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            SQSymbol(symbol: leadingIcon)
                .foregroundStyle(Color.textSecondary)
            
            Content(componentType: componentType)
                .padding(.leading, 12)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .padding(.horizontal, 24)
        .background(Color.bgGrey3)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(.horizontal, 16)
    }
}

// MARK: - Content

private struct Content: View {
    
    let componentType: SQToastMessage.ComponentType
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            switch componentType {
            case .onlyMainDescription(let mainDescription):
                Text(mainDescription)
                    .font(.title01(.semiBold))
                    .foregroundStyle(.white)
                    .lineLimit(1)
                
            case .mainDescriptionWithSubDescription(
                let mainDescription,
                let subDescription,
                let subDescriptionChevronAction
            ):
                Text(mainDescription)
                    .fontWithLineHeight(.title01(weight: .semiBold))
                    .foregroundStyle(.white)
                    .lineLimit(1)
                
                if let subDescriptionChevronAction {
                    Button {
                        subDescriptionChevronAction()
                    } label: {
                        HStack(spacing: 2) {
                            Text(subDescription)
                                .fontWithLineHeight(.body02(weight: .regular))
                                .lineLimit(1)
                            
                            SQSymbol(symbol: .arrowRight, size: 14)
                        }
                    }
                    .foregroundStyle(Color.textSecondary)
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        Color.gray
            .ignoresSafeArea()
        
        VStack {
            SQToastMessage(
                leadingIcon: .video,
                componentType: .onlyMainDescription(mainDescription: "메인 설명")
            )
            
            SQToastMessage(
                leadingIcon: .video,
                componentType: .mainDescriptionWithSubDescription(
                    mainDescription: "메인 설명",
                    subDescription: "서브 설명"
                )
            )
            
            SQToastMessage(
                leadingIcon: .video,
                componentType: .mainDescriptionWithSubDescription(
                    mainDescription: "메인 설명",
                    subDescription: "서브 설명",
                    subDescriptionChevronAction: {
                        print("서브 이벤트 실행")
                    }
                )
            )
        }
    }
}
