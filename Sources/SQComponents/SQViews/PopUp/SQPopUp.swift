//
//  SQPopUp.swift
//  Temp
//
//  Created by Greem on 10/31/24.
//

import SwiftUI
import SqoopDesignSystem

/// 기본 팝업입니다.
public struct SQPopUp: View {
    
    public let label: LabelItem
    public let button: SQPopUpButton
    public let popUpDesc: String?
    
    /// label: 상단 아이콘, 타이틀로 팝업 정보를 표시합니다.
    /// button: 버튼을 생성합니다.
    public init(label: LabelItem,
                button: SQPopUpButton,
                popUpDesc:String?) {
        self.label = label
        self.button = button
        self.popUpDesc = popUpDesc
    }
    /// label: 상단 아이콘, 타이틀로 팝업 정보를 표시합니다.
    /// buttonAction: 버튼 동작을 설정합니다.
    /// btnTitle: 버튼 타이틀을 입력합니다.
    /// popUpDesc: 팝업에서 설명하는 정보를 입력합니다.
    public init(label: LabelItem,
                btnAction: @escaping ()->Void,
                btnTitle:()->String,
                popUpDesc: ()->String?) {
        self.label = label
        self.button = SQPopUpButton(title: btnTitle(), action: btnAction)
        self.popUpDesc = popUpDesc()
    }
    public var body: some View {
        VStack(spacing: 0) {
            PopUpAlertLabel(icon: label.icon ?? .error,
                            title: label.title).padding(.horizontal, 16)
            
            button.padding(.horizontal, 16)
            if let popUpDesc {
                PopUpDescription(popUpDesc: popUpDesc)
                    .padding(.vertical, 20)
            } else {
                Rectangle().fill(.clear).frame(height: 4)
            }
        }
        .padding(.vertical, 8)
        .background(Color.bgGrey3)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(minWidth: 343,maxWidth: 408)
    }
}




#Preview {
    ZStack {
        Color.black.ignoresSafeArea(.all)
        
        SQPopUp(label: .init(icon: .info, title: "sadf")) {
            print("Hello world")
        } btnTitle: { "버튼명" }
        popUpDesc: { "설명은 이렇게 넣는거야!!" }
        
    }.loadSqoopFontSystem()
}
