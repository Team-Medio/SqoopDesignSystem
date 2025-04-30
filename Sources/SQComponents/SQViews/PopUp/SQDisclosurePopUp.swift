//
//  SQDisclosurePopUp.swift
//  Temp
//
//  Created by Greem on 10/31/24.
//

import SwiftUI
import SqoopDesignSystem

/// 닫았다가 열었다가 할 수 있는 팝업입니다.
public struct SQDisclosurePopUp: View {
    
    @Binding var isExpanded: Bool
    
    public let label: LabelItem
    public let button: SQPopUpButton
    public let popUpDesc: String?
    
    public init(
        label: LabelItem,
        isExpanded: Binding<Bool>,
        button: SQPopUpButton,
        popUpDesc: String?
    ) {
        self.label = label
        self._isExpanded = isExpanded
        self.popUpDesc = popUpDesc
        self.button = button
    }
    
    public init(
        label: LabelItem,
        isExpanded: Binding<Bool>,
        btnAction: @escaping ()->Void,
        btnTitle: ()->String,
        popUpDesc: ()->String?
    ) {
        self.label = label
        self._isExpanded = isExpanded
        self.popUpDesc = popUpDesc()
        self.button = SQPopUpButton(title: btnTitle(), action: btnAction)
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            DisclosurePopUpAlertLabel(
                icon: label.icon ?? .error,
                title: label.title,
                isExpanded: $isExpanded
            )
            
            if isExpanded {
                button
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                
                if let popUpDesc {
                    PopUpDescription(popUpDesc: popUpDesc)
                        .padding(.vertical, 20)
                }
            }
        }
        .background(Color.bgGrey3)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(minWidth: 343, maxWidth: 408)
    }
}

#Preview {
    @Previewable @State var isExpanded: Bool = false
    ZStack {
        Color.black.ignoresSafeArea(.all)
        SQDisclosurePopUp(label: .init(icon: .info, title: "경고문"), isExpanded: $isExpanded) {
            print("hello world")
        } btnTitle: { "버튼명"
        } popUpDesc: {
            "안녕하세요"
        }.padding(.horizontal, 16)
    }.loadSqoopFontSystem()
}
