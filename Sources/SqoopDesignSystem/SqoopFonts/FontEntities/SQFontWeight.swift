//
//  FontWeight.swift
//  Sqoop
//
//  Created by Greem on 10/8/24.
//

import Foundation

public enum SQFontWeight{
    case regular
    case bold
    case semiBold
    case medium
}

extension SQFontWeight{
    var name:String{
        switch self{
        case .bold: "Bold"
        case .medium: "Medium"
        case .regular: "Regular"
        case .semiBold:"SemiBold"
        }
    }
}
