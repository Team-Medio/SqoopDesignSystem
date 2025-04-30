//
//  File.swift
//  SqoopDesignSystem
//
//  Created by Greem on 10/31/24.
//

import SwiftUI


// Generic을 사용한 ViewBuilder로 SwiftUI에 작동방식에 더 fit한 방법 구현
public extension SQNavigationBar where Leading == EmptyView {
    init (type: NaviType) { self.type = type }
}
public extension SQNavigationBar where Trailing == EmptyView {
    init (type: NaviType) { self.type = type }
}
public extension SQNavigationBar where Trailing == EmptyView, Leading == EmptyView{
    init (type: NaviType) { self.type = type }
}
