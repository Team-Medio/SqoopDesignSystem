//
//  SQAsyncImage.swift
//  SqoopDesignSystem
//
//  Created by 김민준 on 3/24/25.
//

import SwiftUI

public struct SQAsyncImage: View {
    
    @State private var image: UIImage?
    @State private var isFirstLoad = false
    
    public let imageURLString: String
    public let width: CGFloat
    public let height: CGFloat
    
    public init(imageURLString: String, width: CGFloat, height: CGFloat) {
        self.imageURLString = imageURLString
        self.width = width
        self.height = height
    }
    
    public var body: some View {
        Group {
            if let safeImage = image {
                Image(uiImage: safeImage)
                    .resizable()
                    .scaledToFill()
            } else {
                Rectangle()
                    .foregroundStyle(Color.bdGrey4)
            }
        }
        .frame(width: width, height: height)
        .onAppear {
            if !isFirstLoad {
                isFirstLoad = true
                loadImage()
            }
        }
        .onChange(of: imageURLString) { oldValue, newValue in
            if oldValue != newValue {
                loadImage()
            }
        }
    }
    
    /// 이미지를 로드합니다.
    private func loadImage() {
        guard !imageURLString.isEmpty else { return }
        Task {
            do {
                let image = try await ImageCacheManager.shared.read(imageURLString)
                await MainActor.run {
                    withAnimation {
                        self.image = image
                    }
                }
            } catch {
                print(error)
            }
        }
    }
}
