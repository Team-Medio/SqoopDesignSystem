//
//  File.swift
//  SqoopDesignSystem
//
//  Created by Greem on 11/8/24.
//

import Foundation

@MainActor public extension String {
     var localized: String {
         let loc = String(format: NSLocalizedString(self, bundle: .designSystem, comment: ""))
         return loc
    }
}

@MainActor public extension String {
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self,bundle: .designSystem, comment: comment)
    }
    func localized(with arguments: [CVarArg] = [], comment: String = "") -> String {
        return String(format: self.localized(comment: comment), arguments: arguments)
    }
}
