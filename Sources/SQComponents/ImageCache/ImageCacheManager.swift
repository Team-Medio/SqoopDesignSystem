//
//  ImageCacheManager.swift
//  Sqoop
//
//  Created by 김민준 on 3/23/25.
//

import UIKit

/// 이미지 캐싱을 위한 싱글톤 매니저
final actor ImageCacheManager {
    
    /// 싱글톤
    static let shared = ImageCacheManager()
    private init() {}
    
    /// NSCache: Key-Value 타입으로 캐시 가능
    ///
    /// - NSCache는 자동으로 메모리 해제.
    /// - Key-Value 둘 다 class 여야함.
    /// - 메모리 관리 상 참조타입이 이점이 있어서라고 함!
    private var memoryCache = NSCache<NSString, UIImage>()
    
    /// 디스크 캐시용 파일 매니저
    private var diskCache = FileManager.default
    
    /// 디버그 모드 플래그
    private var isDebugMode = true
    
    /// 이미지 캐싱에서 발생할 수 있는 에러
    enum ImageCacheError: Error {
        
        /// 유효하지 않은 URL
        case invalidURL
        
        /// Image 생성 실패
        case failedToImage
        
        /// 키 생성 실패
        case failedToCreateKey
        
        /// 디스크 캐싱 실패
        case failedToCacheToDisk
    }
}

// MARK: - Action

extension ImageCacheManager {
    
    /// 이미지를 불러옵니다.
    func read(_ urlString: String) async throws -> UIImage {
        
        let key = try urlString.toKey()
        
        // 1. 메모리 캐시에서 이미지 검색
        guard let memoryImage = readFromMemory(key) else {
            
            // 2. 캐싱된 이미지가 없을 경우 네트워킹을 통한 이미지 반환 및 캐싱
            let createImage = try await urlToImage(urlString)
            try cacheToMemory(key, image: createImage)
            log(urlString, "새로 저장 후 반환")
            return createImage
        }
        
        log(urlString, "메모리 캐시에서 반환")
        return memoryImage
    }
}

// MARK: - Memory Cache

private extension ImageCacheManager {
    
    /// 메모리에서 이미지를 불러옵니다.
    func readFromMemory(_ key: String) -> UIImage? {
        memoryCache.object(forKey: key as NSString)
    }
    
    /// 메모리에 이미지를 캐싱합니다.
    func cacheToMemory(_ key: String, image: UIImage) throws {
        memoryCache.setObject(image, forKey: key as NSString)
    }
}

// MARK: - Disk Cache

private extension ImageCacheManager {
    
    /// 디스크에서 이미지를 불러옵니다.
    func readFromDisk(_ key: String) throws -> UIImage? {
        let diskPath = try diskPath(key)
        guard diskCache.fileExists(atPath: diskPath) else { return nil }
        return UIImage(contentsOfFile: diskPath)
    }
    
    /// 디스크에 이미지를 캐싱합니다.
    func cacheToDisk(_ key: String, image: UIImage) throws {
        let diskPath = try diskPath(key)
        guard !diskCache.fileExists(atPath: diskPath) else { return }
        guard diskCache.createFile(
            atPath: diskPath,
            contents: image.jpegData(compressionQuality: 1.0)
        ) else {
            throw ImageCacheError.failedToCacheToDisk
        }
    }
    
    /// 디스크 경로를 반환합니다.
    func diskPath(_ key: String) throws -> String {
        let documentURL = try diskCache.url(
            for: .cachesDirectory, // FileManager에서 접근할 Directory
            in: .userDomainMask, // FileManager에서 접근할 Domain
            appropriateFor: nil, // 반환되는 URL(특정 조건이 아니면 무시 해도 됨)
            create: true // 지정한 경로에 Directory가 없을 시 생성 여부
        )
        let fileURL = documentURL.appendingPathComponent(key)
        return fileURL.path()
    }
}

// MARK: - Converter

private extension ImageCacheManager {
    
    /// URL 타입을 UIImage 타입으로 반환합니다.
    func urlToImage(_ urlString: String) async throws -> UIImage {
        guard let url = URL(string: urlString) else { throw ImageCacheError.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let image = UIImage(data: data) else { throw ImageCacheError.failedToImage }
        return image
    }
}

// MARK: - Helper

private extension ImageCacheManager {
    
    /// 디버그 모드 일 때 로그를 출력합니다.
    func log(_ urlString: String, _ message: String) {
        guard isDebugMode else { return }
        print("[URL] \(urlString)\n[message] \(message)\n")
    }
}

private extension String {
    
    /// 캐싱을 위한 Key를 생성합니다.
    func toKey() throws -> String {
        guard let data = self.data(using: .utf8) else {
            throw ImageCacheManager.ImageCacheError.failedToCreateKey
        }
        return data.base64EncodedString()
    }
}
