//
//  LanguageCount.swift
//  SqoopDesignDemos
//
//  Created by Greem on 11/24/24.
//

import Foundation
/// 수 단위 표시기
/// 스쿱에서 사용하는 단위 시스템 정의입니다.
fileprivate extension LanguageType {
    var targetCnts: [Int] {
        switch self {
        case .en: [7, 4]
        case .ja: [8, 5]
        case .ko: [8, 5, 4]
        }
    }
    var chunkTexts: [String] {
        switch self {
        case .en: ["M","K"]
        case .ja: ["億","万"]
        case .ko: ["억","만","천"]
        }
    }
    
    func sqNumeralSystem(number:Int) -> String {
        let (targetCnts,targetChunks) = (self.targetCnts, self.chunkTexts)
        let subscriberStr = String(number)
        let digitCnt = subscriberStr.count // 현재 숫자가 n이 자리 수
        for (targetCnt,targetChunk) in zip(targetCnts,targetChunks) {
            // 현재 숫자가 위의 자리 수보다 크거나 같음 1234(4자리) >= 1000(4자리)
            if digitCnt >= targetCnt {
                // 분리할 영역을 찾음 4 - 4 + 1 -> 1자리
                let fromIdx = subscriberStr.index(
                    subscriberStr.startIndex,
                    offsetBy: (digitCnt - targetCnt + 1)
                )
                // 몫과 소수점으로 표시할 부분을 분리함
                let (share,remainder) = (subscriberStr[..<fromIdx], String(subscriberStr[fromIdx...]))
                // 소수점 부분 메서드 호출
                return "\(share)\(sqRemainderText(remainder: remainder, shareCount: share.count))\(targetChunk)"
            }
        }
        return "\(number)"
    }
    /// 소수점 표시를 위한 계산 로직
    private func sqRemainderText(remainder:String, shareCount:Int)-> String {
        /// 몫이 3개 이상이면 나머지 출력 X
        /// 몫이 2개이면 나머지 1개 출력
        /// 몫이 1개이면 나머지 2개 출력
        let pre = 3 - shareCount
        guard pre > 0 else { return "" }
        let endIdx = remainder.index(
            remainder.startIndex,
            offsetBy: pre
        )
        var substrs:String = String(remainder[..<endIdx])
        while !substrs.isEmpty {
            guard let last = substrs.last, last == "0" else { break }
            _ = substrs.popLast()
        }
        return substrs.count > 0 ? ".\(substrs)" : ""
    }
}
extension Int {
    /// 스쿱에서 제공하는 숫자 시스템
    /// ex) 1.2k / 1.2천 / 112만 ...
    func sqNumeralSystem(
        language: LanguageType = LanguageType.getPreffered()
    ) -> String {
        language.sqNumeralSystem(number: self)
    }
}

