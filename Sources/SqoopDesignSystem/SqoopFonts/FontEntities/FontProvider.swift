//
//  FontProvider.swift
//  Sqoop
//
//  Created by Greem on 10/9/24.
//

import Foundation
import SwiftUI
#if canImport(UIKit)
import UIKit
#else
import AppKit
#endif

protocol FontProvider{
    func getFont(fontSystem:SQFontSystem) -> Font
    #if canImport(UIKit)
    func getUIFont(fontSystem:SQFontSystem) -> UIFont
    #else
    func getNSFont(fontSystem:SQFontSystem) -> NSFont
    #endif
    var getFontWeights: [SQFontWeight] { get }
}
