//
//  SQNavigationBar.swift
//  Sqoop
//
//  Created by 김민준 on 10/14/24.
//

import SwiftUI
import SqoopDesignSystem

public extension SQNavigationBar {
    enum NaviType{
        case empty
        case cancel(cancelAction: Action)
        case back(backAction: Action)
        case label(title: String)
        case cancelLabel(title: String, cancelAction: Action)
        case backLabel(title: String, backAction: Action)
        case editableLabel(title: String = "", isEditing: Bool ,backAction: Action? = nil, editAction: Action? = nil)
        case custom(title: String = "", leadingView: (() -> Leading)? = nil , trailingView: (()->Trailing)? = nil)
    }
}

// Generic을 사용한 ViewBuilder로 SwiftUI에 작동방식에 더 fit한 방법 구현
public struct SQNavigationBar<Leading: View, Trailing: View>: View {
    public typealias Action = () -> Void
    public let type: NaviType
    var title: String {
        switch type {
        case .empty, .cancel, .back: ""
        case .label(title: let title),
            .cancelLabel(title: let title, cancelAction: _),
            .backLabel(title: let title, backAction: _ ),
            .custom(title: let title, leadingView: _, trailingView: _): title
        case .editableLabel(title: let title,isEditing: let isEditing, backAction: _, editAction: _) : isEditing ? "Edit".localized : title
        }
    }
    public init(type: NaviType) { self.type = type }
    
    public var body: some View {
        ZStack {
            Text(title)
                .font(.headline02)
                .foregroundStyle(Color.textPrimary)
                .animation(nil)
            HStack(spacing: 0) {
                Group {
                    if case let .back(backAction) = type {
                        BackButton(perform: backAction)
                    }
                    if case let .backLabel(_, backAction) = type {
                        BackButton(perform: backAction)
                    }
                    if case let .custom(_, leadingView, _) = type {
                        leadingView?().foregroundStyle(.white)
                    }
                    if case let .editableLabel(_, isEditing , backAction, _) = type {
                        if isEditing {
                            Button(action: {
                                backAction?()
                            }) {
                                Text("Cancel".localized)
                                    .font(.headline03(.semiBold))
                                    .foregroundStyle(Color.textPrimary)
                            }
                        } else {
                            BackButton(perform: backAction).disabled(isEditing)
                        }
                    }
                }
                
                Spacer()
                
                Group {
                    if case let .cancel(cancelAction) = type {
                        CancelButton(perform: cancelAction)
                    }
                    if case let .cancelLabel(_, cancelAction) = type {
                        CancelButton(perform: cancelAction)
                    }
                    if case let .custom(_ , _ , trailingView) = type {
                        trailingView?().foregroundStyle(Color.textPrimary)
                    }
                    if case let .editableLabel(_, isEditing,_ , editAction) = type {
                        Button(action: {
                            editAction?()
                        }) {
                            Text(isEditing ? "Done".localized : "Edit".localized)
                                .font(.headline03(.semiBold))
                                .foregroundStyle(Color.textPrimary)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
        .frame(height: 40)
        .background(.clear)
    }
}

// MARK: - BackButton
private struct BackButton: View {
    
    let backAction: SQNavigationBar.Action?
    
    init(perform backAction: SQNavigationBar.Action?) {
        self.backAction = backAction
    }
    
    var body: some View {
        Button {
            backAction?()
        } label: {
            Image(symbol: .arrowLeft)
                .foregroundStyle(Color.textPrimary)
        }
    }
}

// MARK: - CancelButton

private struct CancelButton: View {
    
    let cancelAction: SQNavigationBar.Action?
    
    init(perform cancelAction: SQNavigationBar.Action?) {
        self.cancelAction = cancelAction
    }
    
    var body: some View {
        Button {
            cancelAction?()
        } label: {
            Image(systemName: SFSymbol.close.name)
                .foregroundStyle(Color.textPrimary)
        }
        .tint(Color.textPrimary)
        .frame(width: 24, height: 24)
    }
}
// MARK: - Preview
#Preview(body: {
    SQNavigationBar(type: .back(backAction: {
        print("Hello world")
    }))
})
