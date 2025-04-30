//
//  File.swift
//  SqoopDesignSystem
//
//  Created by TEO on 11/25/24.
//

import Foundation
import SwiftUI


public struct SQSearchBar: View {
    @Binding var searchText: String
    var onSearch: () -> Void
    
    public init(searchText: Binding<String>, onSearch: @escaping () -> Void) {
        _searchText = searchText
        self.onSearch = onSearch
    }
    
    public var body: some View {
        HStack {
            HStack {
                Image(symbol: .search)
                    .font(.system(size: 18))
                    .foregroundColor(Color.textSecondary)
                
                TextField("검색하기", text: $searchText)
                    .foregroundStyle(Color.textSecondary)
                    .textFieldStyle(PlainTextFieldStyle())
                    .fontWithLineHeight(.body02(weight: .regular))
                    .onSubmit {
                        onSearch()
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                                        to: nil, from: nil, for: nil)
                    }
                    .frame(height: 20)
                
                Spacer()
                
                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                    }) {
                        Image(symbol: .searchCancel)
                            .foregroundStyle(Color.textSecondary)
                    }
                }
            }
            .padding(.horizontal, 13)
            .padding(.vertical, 14)
        }
        .background(Color.bgGrey2)
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
