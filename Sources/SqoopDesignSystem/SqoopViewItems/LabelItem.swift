//
//  LabelItem.swift
//  Temp
//
//  Created by Greem on 10/31/24.
//
public struct LabelItem {
    public let icon: SFSymbol?
    public let title: String
    public init(icon: SFSymbol? = nil, title: String) {
        self.icon = icon
        self.title = title
    }
}
